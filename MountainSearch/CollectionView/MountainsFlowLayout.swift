//
//  MountainsFlowLayout.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsFlowLayout: UICollectionViewFlowLayout {
	// easily configurable values
	private let scrollDir: UICollectionView.ScrollDirection = .vertical
	private let minLineSpacing: CGFloat = 8.0
	private let minInterItemSpacing: CGFloat = 8.0
	private let sectInsets: UIEdgeInsets = UIEdgeInsets(top: 25.0, left: 8.0, bottom: 25.0, right: 8.0)
	private let itemHeight: CGFloat = 40.0
	
	override func prepare() {
		// configuration
		scrollDirection = scrollDir
		minimumLineSpacing = minLineSpacing
		minimumInteritemSpacing = minInterItemSpacing
		sectionInset = sectInsets
		itemSize = calculateItemSize()
	}
	
	private func calculateItemSize() -> CGSize {
		// get full width
		let collectionViewWidth = UIScreen.main.bounds.size.width

		// subtract left & right margins
		let fullWidthMinusHorizontalMargins = collectionViewWidth - (sectInsets.left + sectInsets.right)
		
		// subtract interItemSpacing
		let widthMinusInterItemSpacing = fullWidthMinusHorizontalMargins - minInterItemSpacing
		
		// the objective is 2 items per row so divide by 2 to get width of individual item
		let itemWidth = widthMinusInterItemSpacing / 2.0
		
		// dynamic width & static height
		return CGSize(width: itemWidth, height: itemHeight)
	}
}
