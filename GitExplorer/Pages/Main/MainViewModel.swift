//
//  MainViewModel.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {

	@Published var searchText: String = ""

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
			.print("*")
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
						self?.repositories = searchResult.repositories ?? []
					}
				case .failure(let failure):
					print(failure)
			}
		}
	}

}

extension MainViewModel: Previewable {
	static func preview() -> MainViewModel {
		MainViewModel()
	}
}
