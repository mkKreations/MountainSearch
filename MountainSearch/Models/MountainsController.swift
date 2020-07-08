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
	
	mutating func filteredMountains(forText text: String?) -> (mountains: [Mountain], indexes: [Int]?) {
		if text != nil && !text!.isEmpty {
			// tmp variables for storage
			var tmpMountains = [Mountain]()
			var tmpIndexes = [Int]()
			mountains.enumerated().forEach { (mountainIndex, mountain) in
				// lowercase all text so we can filter appropriately
				if mountain.name.lowercased().hasPrefix(text!.lowercased()) {
					tmpMountains.append(mountain)
				} else {
					tmpIndexes.append(mountainIndex) // mountains to be deleted
				}
			}
			return (mountains: tmpMountains, indexes: tmpIndexes)
		}
		
		// just return our generated mountains with no indexes
		return (mountains: mountains, indexes: nil)
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
