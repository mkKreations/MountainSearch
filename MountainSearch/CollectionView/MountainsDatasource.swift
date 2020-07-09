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
	
	override init() {
		// reading from our raw data upon initialization
		_ = controller.exposedMountains
	}
	
	// we'll pass back the indexPaths of the Mountains that
	// were filtered out so we can delete them
	func filterMountains(forText text: String) -> (indexPaths: [IndexPath]?, searchPatternState: MountainsController.SearchPattern) {
		// make sure to set this property on our controller
		controller.filterText = text
		// get indexes from controller to make IndexPaths
		let diffMountains = controller.filteredMountains(forText: text)
		// create indexPaths from filtered Mountains - we only have 1 section
		let indexPaths = diffMountains.indexes?.map { IndexPath(row: $0, section: 0) }
		// send out to our viewController
		return (indexPaths: indexPaths, searchPatternState: diffMountains.searchPatternState)
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return controller.exposedMountains.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MountainsCell.reuseIdentifier, for: indexPath) as! MountainsCell
		cell.displayText = controller.exposedMountains[indexPath.row].name
		return cell
	}
}
