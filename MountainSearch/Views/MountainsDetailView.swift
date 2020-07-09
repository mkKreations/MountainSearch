//
//  MountainsDetailView.swift
//  MountainSearch
//
//  Created by Marcus on 7/9/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsDetailView: UIView {
	let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.isScrollEnabled = false
		addSubview(tableView)
		
		layoutTableView()
	}
	
	private func layoutTableView() {
		tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsDetailView")
	}
}
