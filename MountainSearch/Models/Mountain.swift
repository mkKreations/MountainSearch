//
//  Mountain.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import Foundation

// our model object to represent a Mountain

struct Mountain {
	let name: String
	let height: Int
}

// keeping this extension here for simplicity

extension Mountain: Comparable {
	// so we can compare instances of Mountain
	static func < (lhs: Mountain, rhs: Mountain) -> Bool {
		lhs.name < rhs.name
	}
}
