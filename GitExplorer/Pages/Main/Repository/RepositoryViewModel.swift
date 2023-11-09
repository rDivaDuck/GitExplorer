//
//  RepositoryViewModel.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI
import Combine

class RepositoryViewModel: ObservableObject {

	let repository: Repository

	@Published var releaseVersion: String = ""

	private var subscriptions = Set<AnyCancellable>()

	init(_ repository: Repository) {
		self.repository = repository
		Task { await fetchTags(for: repository) }
	}

	@MainActor
	func fetchTags(for repository: Repository) async {
		let result = await GithubAPI.tags(for: repository)
		switch result {
			case .success(let tags):
				self.releaseVersion = tags.first?.name ?? "N/A"
			case .failure(let failure):
				print(failure)
		}
	}

}

extension RepositoryViewModel: Previewable {
	static func preview() -> RepositoryViewModel {
		RepositoryViewModel(.preview())
	}
}
