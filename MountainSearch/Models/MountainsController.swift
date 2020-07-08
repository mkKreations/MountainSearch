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
	enum SearchPattern {
		case none
		case ascending
		case descending
	}
	
	private var searchPattern: SearchPattern = .none

	// only generate mountains when we need them
	// this will be our underlying data
	private lazy var mountains: [Mountain] = generateMountains()
	lazy var exposedMountains: [Mountain] = mountains // will originally set to our underlying data
	
	// keep track of filtered text
	private var previousFilterText: String = ""
	var filterText: String = "" {
		didSet {
			if filterText.count > previousFilterText.count {
				searchPattern = .ascending
			} else if previousFilterText.count > filterText.count {
				searchPattern = .descending
			} else {
				searchPattern = .none
			}
		}
	}
		
	mutating func filteredMountains(forText text: String) -> (indexes: [Int]?, searchPatternState: SearchPattern) {
		switch searchPattern {
		case .ascending:
			let currentMountains = mountains.filter { $0.name.hasPrefix(filterText) }
			let previousMountains = mountains.filter { $0.name.hasPrefix(previousFilterText) }
			var tmpIndexes = [Int]()
			print("all the way up!")
			print("Current: \(currentMountains)")
			print("Previous: \(previousMountains)")
			if currentMountains == previousMountains {
				print("NO CHANGE IN INDEXPATHS")
			} else {
				// get indexes of items to delete
				for (index, mountain) in previousMountains.enumerated() {
					if currentMountains.contains(mountain) { continue }
					tmpIndexes.append(index)
				}
			print("Indexes to delete: \(tmpIndexes)")
			}
			previousFilterText = filterText
			exposedMountains = currentMountains
			return (indexes: tmpIndexes, searchPatternState: searchPattern)
		case .descending:
			let currentMountains = mountains.filter { $0.name.hasPrefix(filterText) }
			let previousMountains = mountains.filter { $0.name.hasPrefix(previousFilterText) }
			var tmpIndexes = [Int]()
			print("all the way down!")
			print("Current: \(currentMountains)")
			print("Previous: \(previousMountains)")
			if currentMountains == previousMountains {
				print("NO CHANGE IN INDEXPATHS")
			} else {
				// get indexes of items to add
				for (index, mountain) in currentMountains.enumerated() {
					if previousMountains.contains(mountain) { continue }
					tmpIndexes.append(index)
				}
				print("Indexes to add: \(tmpIndexes)")
			}
			previousFilterText = filterText
			exposedMountains = currentMountains
			return (indexes: tmpIndexes, searchPatternState: searchPattern)
		case .none:
			// nothing to do in this case
			print("no change my good fellow")
			exposedMountains = mountains // reset to underlying data
			return (indexes: nil, searchPatternState: searchPattern)
		}
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
