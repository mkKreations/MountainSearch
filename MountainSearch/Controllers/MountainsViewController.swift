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
	
	override func loadView() {
		view = MountainsView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let mountainsView = view as? MountainsView else { return }
		
		mountainsView.collectionView.backgroundColor = .red
		mountainsView.collectionView.register(MountainsCell.self, forCellWithReuseIdentifier: MountainsCell.reuseIdentifier)
		mountainsView.collectionView.dataSource = dataSource
	}
	
}
