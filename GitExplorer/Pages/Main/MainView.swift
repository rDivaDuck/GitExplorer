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
			SearchTextField(searchText: $viewModel.searchText)
				.padding(.horizontal, 20)
			LazyVStack(spacing: 24) {
				ForEach(viewModel.repositories) { repo in
					Button {
						coordinator.present(repo)
					} label: {
						RepositoryCell(repository: repo)
							.padding(.horizontal, 20)
					}
				}
			}
		}.onAppear {
			viewModel.searchText = "stra"
		}
	}
}

#Preview {
	NavigationStack {
		MainView(coordinator: MainCoordinator(navigationController: UINavigationController()), viewModel: .preview())
	}
}
