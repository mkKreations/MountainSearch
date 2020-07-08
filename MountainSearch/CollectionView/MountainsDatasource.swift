//
//  MountainsDatasource.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsDatasource: NSObject, UICollectionViewDataSource {
	// only this class needs to know about our controller
	private var controller = MountainsController()
	
	private var filterText: String?
	
	override init() {
		// reading from our raw data upon initialization
		_ = controller.mountains
	}
	
	// we'll pass back the indexPaths of the Mountains that
	// were filtered out so we can delete them
	func filterMountains(forText text: String?) -> [IndexPath]? {
		filterText = text // set our internal property to update collectionView datasource methods correctly
		
		// compose indexPaths of deleted items
		return nil
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return controller.filteredMountains(forText: filterText).mountains.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MountainsCell.reuseIdentifier, for: indexPath) as! MountainsCell
		cell.displayText = controller.filteredMountains(forText: filterText).mountains[indexPath.row].name
		return cell
	}
}
