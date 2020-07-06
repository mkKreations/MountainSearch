//
//  MountainsFlowLayout.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsFlowLayout: UICollectionViewFlowLayout {
	private let scrollDir: UICollectionView.ScrollDirection = .vertical
	private let minLineSpacing: CGFloat = 8.0
	private let minInterItemSpacing: CGFloat = 8.0
	private let sectInsets: UIEdgeInsets = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 0.0, right: 0.0)
	
	override func prepare() {
		// configuration
		scrollDirection = scrollDir
		minimumLineSpacing = minLineSpacing
		minimumInteritemSpacing = minInterItemSpacing
		sectionInset = sectInsets
	}
}
