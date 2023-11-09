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
				ForEach(viewModel.repositories) { repo in
					Button {
						coordinator.present(repo)
					} label: {
						Text(repo.name ?? "")
					}
				}
			}
			.searchable(text: $viewModel.searchText, prompt: Text("search something"))
		}.onAppear {
//			viewModel.searchText = "stra"
		}
	}
}

#Preview {
	MainView(coordinator: MainCoordinator(navigationController: UINavigationController()), viewModel: .preview())
}
