//
//  MainView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct MainView: View {

	let coordinator: MainCoordinator

	var body: some View {
		Button {
			coordinator.showRepo(with: .random())
		} label: {
			Text("Hello, World!")
		}
	}
}

#Preview {
	MainView(coordinator: MainCoordinator(navigationController: UINavigationController()))
}
