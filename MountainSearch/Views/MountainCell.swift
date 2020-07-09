//
//  MountainCell.swift
//  MountainSearch
//
//  Created by Marcus on 7/9/20.
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
		
		contentView.backgroundColor = .darkBackgroundColor
		
		contentView.layer.borderColor = UIColor.darkGray.cgColor
		contentView.layer.borderWidth = 1.0
		
		displayLabel = UILabel(frame: .zero)
		displayLabel.translatesAutoresizingMaskIntoConstraints = false
		displayLabel.textColor = .label
		displayLabel.numberOfLines = 1
		displayLabel.font = .systemFont(ofSize: 16)
		contentView.addSubview(displayLabel)
		
		displayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
		displayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
		displayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8.0).isActive = true
	}
	required init?(coder: NSCoder) {
		fatalError("Crash in MountainsCell")
	}
}
