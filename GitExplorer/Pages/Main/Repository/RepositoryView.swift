//
//  RepositoryView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct RepositoryView: View {

	let repository: Repository

	var body: some View {
		VStack(spacing: 0) {
			header
			infoStack
			Spacer()
		}
	}

	var header: some View {
		VStack(spacing: 0) {
			AsyncImage(
				url: URL(string: repository.owner?.avatarURL ?? ""),
				content: { image in
					image
						.resizable()
						.scaledToFit()
						.frame(maxHeight: 100)
						.cornerRadius(6)
				},
				placeholder: {
					PlaceholderIcon()
						.frame(maxHeight: 100)
				}
			)
			Text("\(repository.name ?? "") / \(repository.owner?.name ?? "")")
				.font(.system(size: 16, weight: .medium))
				.padding(.top, 14)
			Text(repository.language ?? "")
				.font(.system(size: 14))
				.foregroundStyle(Color(Asset.Colors.Secondary.text))
				.padding(.top, 6)
		}
	}

	var infoStack: some View {
		VStack(spacing: 14) {
			forks
			Divider()
			issues
			Divider()
			starred
			Divider()
			Text("Last updated")
				.frame(maxWidth: .infinity, alignment: .leading)
		}
		.foregroundColor(Color(Asset.Colors.Primary.text))
		.font(.system(size: 14))
		.padding(20)
		.overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(Color(Asset.Colors.Primary.divider), lineWidth: 1)
		)
		.padding(.horizontal, 20)
		.padding(.top, 30)
	}

	var forks: some View {
		LabeledContent {
			Text(repository.forksCount?.description ?? "")
		} label: {
			Text("Forks")
		}
	}

	var issues: some View {
		LabeledContent {
			Text(repository.openIssuesCount?.description ?? "")
		} label: {
			Text("Issues")
		}
	}

	var starred: some View {
		LabeledContent {
			Text(repository.stargazersCount?.description ?? "")
		} label: {
			Text("Starred")
		}
	}
}

#Preview {
	RepositoryView(repository: .preview())
}
