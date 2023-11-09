//
//  MainViewModel.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {

	@Published var searchText: String = ""

	@Published var resultCount: Int = 0
	@Published var repositories: [Repository] = []

	private var subscriptions = Set<AnyCancellable>()

	init() {
		setupSubscriptions()
	}

	private func setupSubscriptions() {
		$searchText
			.dropFirst()
			.removeDuplicates()
			.filter { $0.count > 2 }
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.compactMap { $0.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) }
			.sink { [weak self] query in
				self?.search(for: query)
			}
			.store(in: &subscriptions)
	}

	func search(for query: String) {
		Task {
			let result = await GithubAPI.search(for: query)
			switch result {
				case .success(let searchResult):
					DispatchQueue.main.async { [weak self] in
						self?.resultCount = searchResult.totalCount ?? 0
						self?.repositories = searchResult.repositories ?? []
					}
				case .failure(let failure):
					print(failure)
			}
		}
	}

}

extension SearchViewModel: Previewable {
	static func preview() -> SearchViewModel {
		SearchViewModel()
	}
}
