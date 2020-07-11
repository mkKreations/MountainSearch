//
//  MountainsDetailCell.swift
//  MountainSearch
//
//  Created by Marcus on 7/10/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import SwiftUI

struct MountainsDetailCell: View {
	// just displaying data no property wrapper needed
	var mountain: Mountain
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(mountain.name)
				.foregroundColor(.primary)
			
			Text("Altitude: \(mountain.height) meters")
				.font(.subheadline)
				.foregroundColor(.secondary)
		}
	}
}

struct MountainsDetailCell_Preview: PreviewProvider {
	static var controller = MountainsController()
	
	static var previews: some View {
		Group {
			MountainsDetailCell(mountain: controller.mountains.last!)
			MountainsDetailCell(mountain: controller.mountains.last!)
				.previewDevice("iPhone Xs Max")
		}
	}
}
