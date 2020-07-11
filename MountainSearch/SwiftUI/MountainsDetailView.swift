//
//  MountainsDetailView.swift
//  MountainSearch
//
//  Created by Marcus on 7/10/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import SwiftUI

struct MountainsDetailView: View {
	// just displaying data no property wrapper needed
	var mountain: Mountain
	
	var body: some View {
		Form {
			MountainsDetailCell(mountain: mountain)
		}
		.navigationBarTitle(mountain.name)
		.disabled(true) // prevents scrolling
	}
}

struct MountainsDetailView_Preview: PreviewProvider {
	static var controller = MountainsController()

	static var previews: some View {
		Group {
			MountainsDetailView(mountain: controller.mountains.first!)
			MountainsDetailView(mountain: controller.mountains.first!)
				.previewDevice("iPhone Xs Max")
		}
	}
}
