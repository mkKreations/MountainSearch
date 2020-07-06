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
	
	override func loadView() {
		// keep view logic in view
		view = MountainsView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let mountainsView = view as? MountainsView else { return }
		
		// configure collectionView from viewController perspective - nothing UIView related
		mountainsView.collectionView.register(MountainsCell.self, forCellWithReuseIdentifier: MountainsCell.reuseIdentifier)
		mountainsView.collectionView.setCollectionViewLayout(flowLayout, animated: false) // no need to animate
		mountainsView.collectionView.dataSource = dataSource
	}
	
}
