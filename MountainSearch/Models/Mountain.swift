//
//  Mountain.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import Foundation

// our model object to represent a Mountain

struct Mountain: Hashable {
	let name: String
	let height: Int
	let id = UUID() // hashable conformance
}

// so we can compare our Mountains
extension Mountain: Comparable {
	static func < (lhs: Mountain, rhs: Mountain) -> Bool {
		return lhs.name < rhs.name
	}
}
