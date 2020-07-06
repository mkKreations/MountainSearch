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
		// reading from our raw data for first time
		_ = controller.mountains
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return controller.mountains.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MountainsCell.reuseIdentifier, for: indexPath) as! MountainsCell
		return cell
	}
}
