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
		VStack(spacing: 0) {
			searchField
			if viewModel.repositories.isEmpty {
				EmptyStateView()
			} else {
				resultStack
			}
		}.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Text("Repository Library")
					.font(.system(size: 20, weight: .semibold))
			}
		}
	}

	var searchField: some View {
		SearchTextField(searchText: $viewModel.searchText)
			.padding(.horizontal, 20)
	}

	var results: some View {
		ForEach(viewModel.repositories) { repo in
			Button(action: {
				coordinator.present(repo)
			}, label: {
				RepositoryCell(repository: repo)
			})
		}
	}

	var resultsCount: some View {
		Text("\(viewModel.resultCount) results")
			.frame(maxWidth: .infinity, alignment: .leading)
			.font(.system(size: 14))
			.foregroundStyle(Color(Asset.Colors.Secondary.text))
			.padding(.top, 40)
	}

	var resultStack: some View {
		ScrollView {
			VStack(spacing: 20) {
				resultsCount
				LazyVStack(spacing: 24) {
					results
				}
			}
			.padding(.horizontal, 20)
		}
	}
}

#Preview {
	NavigationStack {
		MainView(coordinator: MainCoordinator(navigationController: UINavigationController()), viewModel: .preview())
	}
}
