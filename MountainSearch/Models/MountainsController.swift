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
// our Mountain raw data as well as any
// manipulation to our underlying data

struct MountainsController {
	// this enum will keep track of how user is searching
	enum SearchPattern {
		case none // represents no change
		case ascending // user is adding on to search term
		case descending // user is removing items from search term
	}
	
	// track our searchPattern
	private var searchPattern: SearchPattern = .none

	// only generate mountains when we need them
	private lazy var mountains: [Mountain] = generateMountains() // this will be our underlying data
	lazy var exposedMountains: [Mountain] = mountains // will originally set to our underlying data
	
	// keep track of filtered text
	private var previousFilterText: String = "" // only we need to know about previous
	var filterText: String = "" {
		// update our SearchPattern based on current filterText
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
			return filterMountains(forState: searchPattern)
		case .descending:
			return filterMountains(forState: searchPattern)
		case .none:
			// nothing to do in this case for now but always great to identify this state
			exposedMountains = mountains // reset to underlying data
			return (indexes: nil, searchPatternState: searchPattern)
		}
	}
	
	private mutating func filterMountains(forState searchState: SearchPattern) -> (indexes: [Int], searchPatternState: SearchPattern) {
		// common code
		let currentMountains = mountains.filter { $0.name.hasPrefix(filterText) }
		let previousMountains = mountains.filter { $0.name.hasPrefix(previousFilterText) }
		var tmpIndexes = [Int]()
		
		switch searchState {
		case .ascending:
			// for efficiency, we're not always looking for indexPaths
			if currentMountains != previousMountains {
				// get indexes of items to delete
				for (index, mountain) in previousMountains.enumerated() {
					if currentMountains.contains(mountain) { continue }
					tmpIndexes.append(index)
				}
			}
			previousFilterText = filterText // update previousFilterText
			exposedMountains = currentMountains // update exposed data
			return (indexes: tmpIndexes, searchPatternState: searchPattern)
			
		case .descending:
			// for efficiency, we're not always looking for indexPaths
			if currentMountains != previousMountains {
				// get indexes of items to add
				for (index, mountain) in currentMountains.enumerated() {
					if previousMountains.contains(mountain) { continue }
					tmpIndexes.append(index)
				}
			}
			previousFilterText = filterText // update previousFilterText
			exposedMountains = currentMountains // update exposed data
			return (indexes: tmpIndexes, searchPatternState: searchPattern)
			
		default:
			// this will not be called the way we're using it - this method
			// is really only for .ascending & .descending states since they
			// have a some code in common
			return (indexes: tmpIndexes, searchPatternState: searchPattern)
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
