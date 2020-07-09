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
		
		edgesForExtendedLayout = []
		
		guard let detailView = view as? MountainsDetailView else { return }
		
		detailView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
		detailView.tableView.dataSource = self
	}
}

// this View Controller is so bare that I'll just add UITableViewDatasource conformance here

extension MountainsDetailViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
		if cell.detailTextLabel == nil {
			// we want the default UITableViewCell with subtitle
			cell = UITableViewCell(style: .subtitle, reuseIdentifier: String(describing: UITableViewCell.self))
		}
		
		guard let mount = mountain else { return cell }
		cell.textLabel?.text = mount.name
		cell.detailTextLabel?.text = "Altitude: \(mount.height) meters"
		cell.detailTextLabel?.textColor = .lightGray
		return cell
	}
}
