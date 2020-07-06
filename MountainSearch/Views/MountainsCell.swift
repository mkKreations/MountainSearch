//
//  MountainsCell.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

class MountainsCell: UICollectionViewCell {
	static let reuseIdentifier: String = String(describing: self)
	private var displayLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		displayLabel = UILabel(frame: .zero)
		displayLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(displayLabel)
		
		displayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
		displayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
	}
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsCell")
	}
}
