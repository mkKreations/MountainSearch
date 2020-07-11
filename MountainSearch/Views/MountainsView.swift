//
//  MountainsView.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

// maintaining UIView & layout logic in view

class MountainsView: UIView {
	let collectionView: UICollectionView = UICollectionView(frame: .zero,
																													collectionViewLayout: UICollectionViewFlowLayout())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = UIColor.darkBackgroundColor
		addSubview(collectionView)
		
		layoutCollectionView()
	}
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsView")
	}
	
	private func layoutCollectionView() {
		collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}
}