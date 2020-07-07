//
//  MountainsController.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import Foundation

// this object will be responsible for
// generating our Mountain models from
// our Mountain raw data

struct MountainsController {
	// only generate mountains when we need them
	lazy var mountains: [Mountain] = generateMountains()
	
	mutating func filteredMountains(forText text: String?) -> [Mountain] {
		if text != nil && !text!.isEmpty {
			// lowercase all text so we can filter appropriately
			return mountains.filter { $0.name.lowercased().contains(text!.lowercased()) }
		}
		return mountains
	}
	
	// no need to expose this logic
	private func generateMountains() -> [Mountain] {
		// parse thru Mountains by using newLine as separator
		let components = mountainsRawData.components(separatedBy: CharacterSet.newlines)
		var mountains = [Mountain]()
		for line in components {
			// separate [Mountain Name] from [Mountain Altitude]
			let mountainComponents = line.components(separatedBy: ",")
			let mountainName = mountainComponents[0]
			let mountainAltitude = Int(mountainComponents[1])! // convert to Int
			mountains.append(Mountain(name: mountainName, height: mountainAltitude))
		}
		return mountains.sorted()
	}
}
