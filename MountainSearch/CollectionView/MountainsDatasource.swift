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
	
	var filterText: String?
	
	override init() {
		// reading from our raw data upon initialization
		_ = controller.mountains
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return controller.filteredMountains(forText: filterText).count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MountainsCell.reuseIdentifier, for: indexPath) as! MountainsCell
		cell.displayText = controller.filteredMountains(forText: filterText)[indexPath.row].name
		return cell
	}
}
