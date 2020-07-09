//
//  MountainsDetailViewController.swift
//  MountainSearch
//
//  Created by Marcus on 7/9/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsDetailViewController: UIViewController {
	var mountain: Mountain?
	
	override func loadView() {
		view = MountainsDetailView()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = mountain?.name
		
		guard let detailView = view as? MountainsDetailView else { return }
		
		detailView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: String.init(describing: UITableViewCell.self))
	}
}
