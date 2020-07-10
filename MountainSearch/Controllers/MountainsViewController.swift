//
//  MountainsViewController.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit
import SwiftUI

class MountainsViewController: UIViewController {
	// this nested enum will represent our sections within collectionView
	enum Section {
		case main
	}
	
	
	// MARK: internal properties
	private var searchBar: UISearchBar!
	private var controller: MountainsController = MountainsController()
	private var dataSource: UICollectionViewDiffableDataSource<Section, Mountain>!
	private var collectionView: UICollectionView!
	private let collectionViewDelegate = MountainsCollectionViewDelegate()
	private var currentSearchTerm: String? // always keep track of searchTerm

	
	// MARK: initializers
	init() {
		super.init(nibName: nil, bundle: nil) // have to call desginated init *eyeroll*
		_ = controller.mountains // generate our mountains upon init
	}
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsViewController")
	}
	
	
	// MARK: view lifecycle methods
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Mountains Search"
		
		edgesForExtendedLayout = []
		
		configureSearchBar()
		configureCollectionView()
		configureDatasource() // configure datasource
		snapshotMountains(forSearchTerm: nil) // initial snapshot
		
		collectionViewDelegate.delegate = self
	}
	
	
	// MARK: search bar configuration
	private func configureSearchBar() {
		searchBar = UISearchBar(frame: .zero)
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		searchBar.searchTextField.backgroundColor = .black
		searchBar.barTintColor = .lightGray
		searchBar.delegate = self
		view.addSubview(searchBar)
		
		layoutSearchBar()
	}
	private func layoutSearchBar() {
		searchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
	
	// MARK: collectionView configuration
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCompositionalLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .darkBackgroundColor
		collectionView.register(MountainsCell.self, forCellWithReuseIdentifier: MountainsCell.reuseIdentifier)
		collectionView.delegate = collectionViewDelegate
		view.addSubview(collectionView)
		
		layoutCollectionView()
	}
	private func layoutCollectionView() {
		collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
	
	// MARK: collectionView internal stuff
	private func snapshotMountains(forSearchTerm searchTerm: String?) {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Mountain>()
		snapshot.appendSections([.main])
		snapshot.appendItems(controller.filteredMountains(forSearchTerm: searchTerm),
												 toSection: .main)
		dataSource.apply(snapshot)
	}
	private func configureDatasource() {
		dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView,
																											cellProvider: { (collectionView, indexPath, mountain) -> UICollectionViewCell? in
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MountainsCell.reuseIdentifier,
																													for: indexPath) as? MountainsCell else { return nil }
			cell.displayText = mountain.name
			return cell
		})
	}
	private func configureCompositionalLayout() -> UICollectionViewCompositionalLayout {
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
																					heightDimension: .fractionalHeight(1.0))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
																					 heightDimension: .absolute(40.0))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
		group.interItemSpacing = .fixed(8.0)
		
		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = 8.0
		section.contentInsets = NSDirectionalEdgeInsets(top: 25.0, leading: 8.0, bottom: 25.0, trailing: 8.0)
		
		return UICollectionViewCompositionalLayout(section: section)
	}
}


// MARK: collectionView delegate logic
extension MountainsViewController: MountainsSelectionDelegate {
	func didSelectMountain(atIndexPath indexPath: IndexPath) {
		// get our selected Mountain
		let selectedMountain = controller.filteredMountains(forSearchTerm: currentSearchTerm)[indexPath.row]
		print(selectedMountain.name)
		// pass in Mountain as dependency to our SwiftUI view nested within UIHostingController
		let detailVC = UIHostingController(rootView: MountainsDetailView(mountain: selectedMountain))
		navigationController?.pushViewController(detailVC, animated: true) // pushhhh
	}
}


// MARK: search bar delegate logic
extension MountainsViewController: UISearchBarDelegate {
	// tracking as user searches
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		print(searchText)
		currentSearchTerm = searchText
		snapshotMountains(forSearchTerm: searchText)
	}

	// when user clicks search - dismiss keyboard
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		view.endEditing(true)
	}
	
	// when user clicks cancel - dismiss keyboard
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		view.endEditing(true)
	}

	// manage the showing/hiding of the cancel button with animation
	func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
		searchBar.setShowsCancelButton(true, animated: true)
		return true
	}
	func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
		searchBar.setShowsCancelButton(false, animated: true)
		return true
	}
}
