//
//  MountainsViewController.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsViewController: UIViewController {
	private let dataSource = MountainsDatasource()
	private let flowLayout = MountainsFlowLayout()
	private let collectionDelegate = MountainsCollectionViewDelegate()
	private let searchController = UISearchController(searchResultsController: nil)
	
	override func loadView() {
		// keep view logic in view
		view = MountainsView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
	
		title = "Mountains Search"
		
		
		configureSearchController()
		
		guard let mountainsView = view as? MountainsView else { return }

		// configure collectionView from viewController perspective - nothing UIView related
		mountainsView.collectionView.register(MountainsCell.self, forCellWithReuseIdentifier: MountainsCell.reuseIdentifier)
		mountainsView.collectionView.setCollectionViewLayout(flowLayout, animated: false) // no need to animate
		mountainsView.collectionView.dataSource = dataSource
		mountainsView.collectionView.delegate = collectionDelegate
		
		collectionDelegate.delegate = self // conformance to receive collectionView delegate events
	}
	
	private func configureSearchController() {
		searchController.searchResultsUpdater = self // receive updates from search bar while typing
		searchController.searchBar.placeholder = "Search for mountain"
		searchController.searchBar.sizeToFit() // layout properly in navigationItem
		searchController.obscuresBackgroundDuringPresentation = false // allows user to scroll search results
		navigationItem.searchController = searchController // set on navigationItem
		navigationItem.hidesSearchBarWhenScrolling = false
	}
}

// extension to manage collectionViewDelegate
extension MountainsViewController: MountainsSelectionDelegate {
	func didSelectMountain(atIndexPath indexPath: IndexPath) {
		let detailVC = MountainsDetailViewController()
		let selectedMountain = dataSource.getMountain(atIndexPath: indexPath)
		detailVC.mountain = selectedMountain
		navigationController?.pushViewController(detailVC, animated: true)
	}
}

// extension to manage any search bar related things
extension MountainsViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		// make sure we have text & our view
		guard let text = searchController.searchBar.text else { return }
		guard let mountainsView = view as? MountainsView else { return }

		// inform our dataSource so it can keep data in sync
		let result = dataSource.filterMountains(forText: text)
		
		// make changes to collectionView based on searchPatternState
		switch result.searchPatternState {
		case .ascending:
			// we know we have indexPaths here but only
			// manipulate if indexPaths are not empty
			if !result.indexPaths!.isEmpty {
				mountainsView.collectionView.deleteItems(at: result.indexPaths!)
			}
		case .descending:
			// we know we have indexPaths here but only
			// manipulate if indexPaths are not empty
			if !result.indexPaths!.isEmpty {
				mountainsView.collectionView.insertItems(at: result.indexPaths!)
			}
		case .none:
			// we know we have NO indexPaths here
			print("Just strollin' by")
		}
	}
}
