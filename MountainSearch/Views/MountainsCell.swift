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
	var displayText: String? {
		didSet {
			displayLabel.text = displayText
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.backgroundColor = UIColor.darkBackgroundColor
		
		displayLabel = UILabel(frame: .zero)
		displayLabel.translatesAutoresizingMaskIntoConstraints = false
		displayLabel.textColor = .white
		contentView.addSubview(displayLabel)
		
		displayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
		displayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
	}
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsCell")
	}
}
