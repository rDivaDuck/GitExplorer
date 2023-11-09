//
//  RepositorySearchResult.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

struct RepositorySearchResult: Codable {
	let totalCount: Int?
	let repositories: [Repository]?

	enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case repositories = "items"
	}
}

struct Repository: Codable, Identifiable {
	let id: Int?
	let name: String?
	let fullName: String?
	let owner: Owner?
	let description: String?
	let stargazersCount: Int?
	let language: String?
	let forksCount: Int?
	let openIssuesCount: Int?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case fullName = "full_name"
		case owner
		case description
		case stargazersCount = "stargazers_count"
		case language
		case forksCount = "forks_count"
		case openIssuesCount = "open_issues_count"
	}
}

extension Repository: Previewable {
	static func preview() -> Repository {
		Repository(id: 1, name: "Project", fullName: "rDuck/Project", owner: Owner(name: "rDuck", avatarURL: "https://i.imgur.com/tyYqEeC.png"), description: "Test description Test description Test description Test description Test description", stargazersCount: 100, language: "Swift", forksCount: 12, openIssuesCount: 1)
	}
}

// MARK: - Owner
struct Owner: Codable {
	let name: String?
	let avatarURL: String?

	enum CodingKeys: String, CodingKey {
		case name = "login"
		case avatarURL = "avatar_url"
	}
}
