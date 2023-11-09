//
//  GithubEndpoints.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

enum GithubEndpoints {

	enum Repositories: Endpoint {
		case search(_ query: String)

		var relativePath: String {
			switch self {
				case .search:
					return "search/repositories"
			}
		}

		var parameters: [URLQueryItem]? {
			switch self {
				case .search(let query):
					return [URLQueryItem(name: "q", value: query)]
			}
		}

		var headers: [String: String] {
			["Accept": "application/vnd.github+json"]
		}
	}
}
