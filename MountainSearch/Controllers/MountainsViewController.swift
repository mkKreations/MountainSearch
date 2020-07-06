//
//  MountainsViewController.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsViewController: UIViewController {
	override func loadView() {
		view = MountainsView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let myView = view as? MountainsView else {
			return
		}
		myView.collectionView.backgroundColor = .red
	}
	
}
