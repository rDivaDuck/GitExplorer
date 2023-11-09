//
//  GithubAPI.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

struct GithubAPI: API {

	static var baseURL: URL {
		// swiftlint:disable:next force_unwrapping - comment: Ok -RAH
		URL(string: "https://api.github.com/")!
	}

	static var jsonDecoder: JSONDecoder {
		JSONDecoder()
	}

	static var jsonEncoder: JSONEncoder {
		JSONEncoder()
	}

	static func search(for query: String) async -> Result<RepositorySearchResult, APIError> {
		await Result.catching { try await get(from: GithubEndpoints.Repositories.search(query)) }
	}
}
