//
//  MainView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct SearchView: View {

	let coordinator: MainCoordinator
	@ObservedObject var viewModel: SearchViewModel

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
				Text(L10n.searchTitle)
					.font(.system(size: 20, weight: .semibold))
			}
		}
	}

	var searchField: some View {
		SearchTextField(searchText: $viewModel.searchText)
			.padding(.horizontal, 20)
			.padding(.top, 14)
	}

	var results: some View {
		ForEach(viewModel.repositories) { repo in
			Button(action: {
				coordinator.present(repo)
			}, label: {
				RepositoryCell(repository: repo)
			})
			.buttonStyle(.scaling)
		}
	}

	var resultsCount: some View {
		Text(L10n.searchResults(viewModel.resultCount))
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
		SearchView(coordinator: .preview(), viewModel: .preview())
	}
}
