//
//  MainView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct MainView: View {

	let coordinator: MainCoordinator
	@ObservedObject var viewModel: MainViewModel

	var body: some View {
		ScrollView {
			LazyVStack {
				Button {
					coordinator.showRepo(with: .random())
				} label: {
					Text("Hello, World!")
				}
				ForEach(viewModel.repositories) { repo in
					Text(repo.name ?? "")
				}
			}
		}.onAppear {
			viewModel.searchText = "stra"
		}
	}
}

#Preview {
	MainView(coordinator: MainCoordinator(navigationController: UINavigationController()), viewModel: .preview())
}
