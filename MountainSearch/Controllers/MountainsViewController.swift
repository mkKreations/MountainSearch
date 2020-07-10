//
//  MountainsViewController.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsViewController: UIViewController {
	// this nested enum will represent our sections within collectionView
	enum Section {
		case main
	}
	
	// MARK: internal properties
	private var controller: MountainsController = MountainsController()
	private var dataSource: UICollectionViewDiffableDataSource<Section, Mountain>!
	private var collectionView: UICollectionView!

	
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
		
		edgesForExtendedLayout = []
		
		configureCollectionView()
		configureDatasource() // configure datasource
		snapshotMountains() // initial snapshot
	}
	
	
	// MARK: collectionView configuration
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCompositionalLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .darkBackgroundColor
		collectionView.register(MountainsCell.self, forCellWithReuseIdentifier: MountainsCell.reuseIdentifier)
		view.addSubview(collectionView)
		
		layoutCollectionView()
	}
	private func layoutCollectionView() {
		collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	
	// MARK: collectionView internal stuff
	private func snapshotMountains() {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Mountain>()
		snapshot.appendSections([.main])
		snapshot.appendItems(controller.mountains, toSection: .main)
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
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		
		let section = NSCollectionLayoutSection(group: group)
		section.contentInsets = NSDirectionalEdgeInsets(top: 25.0, leading: 8.0, bottom: 25.0, trailing: 8.0)
		
		return UICollectionViewCompositionalLayout(section: section)
	}
}
