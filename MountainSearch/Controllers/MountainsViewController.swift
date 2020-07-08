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
	}
	
	private func configureSearchController() {
		searchController.searchResultsUpdater = self // receive updates from search bar while typing
		searchController.searchBar.placeholder = "Search for mountain"
		searchController.searchBar.sizeToFit() // layout properly in navigationItem
		// https://stackoverflow.com/questions/30685379/swift-getting-snapshotting-a-view-that-has-not-been-rendered-error-when-try
		searchController.searchBar.layoutIfNeeded() // refer to above link for this line
		navigationItem.searchController = searchController // set on navigationItem
		navigationItem.hidesSearchBarWhenScrolling = false
	}
}

// extension to manage any search bar related things
extension MountainsViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		// make sure we have text & our view
		guard let text = searchController.searchBar.text else { return }
		guard let mountainsView = view as? MountainsView else { return }

		if let _ = dataSource.filterMountains(forText: text) {
//			mountainsView.collectionView.deleteItems(at: indexes)
		}

		mountainsView.collectionView.reloadData() // only reload when we know we have text
		print(text)
	}
}
