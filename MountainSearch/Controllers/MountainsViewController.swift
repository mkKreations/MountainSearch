//
//  MountainsViewController.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsViewController: UIViewController {
	// MARK: dependencies
	var controller: MountainsController = MountainsController()

	
	// MARK: initializers
	init() {
		super.init(nibName: nil, bundle: nil) // have to call desginated init *eyeroll*
		_ = controller.mountains // generate our mountains upon init
	}
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsViewController")
	}
	
	
	// MARK: view lifecycle methods
	override func loadView() {
		view = MountainsView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let myView = view as? MountainsView else { return }
		
		myView.collectionView.backgroundColor = .red
		myView.collectionView.setCollectionViewLayout(configureCompositionalLayout(), animated: false)
	}
	
	
	// MARK: collectionView stuff
	private func configureCompositionalLayout() -> UICollectionViewCompositionalLayout {
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
																					heightDimension: .fractionalHeight(1.0))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
																					 heightDimension: .absolute(40.0))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		
		let section = NSCollectionLayoutSection(group: group)
		
		return UICollectionViewCompositionalLayout(section: section)
	}
}
