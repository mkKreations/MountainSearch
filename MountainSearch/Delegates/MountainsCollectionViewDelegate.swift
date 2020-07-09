//
//  MountainsCollectionViewDelegate.swift
//  MountainSearch
//
//  Created by Marcus on 7/9/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

protocol MountainsSelectionDelegate: AnyObject {
	func didSelectMountain(atIndexPath indexPath: IndexPath)
}

class MountainsCollectionViewDelegate: NSObject, UICollectionViewDelegate {
	// weak conformance to prevent retain cycles
	weak var delegate: MountainsSelectionDelegate?
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// pass along to delegate
		delegate?.didSelectMountain(atIndexPath: indexPath)
	}
	
	// set highlighted colors for cells
	func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
		collectionView.cellForItem(at: indexPath)?.backgroundColor = .darkGray
	}
	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
		collectionView.cellForItem(at: indexPath)?.backgroundColor = .darkBackgroundColor
	}
}
