//
//  RepositoryView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct RepositoryView: View {

	@ObservedObject var viewModel: RepositoryViewModel

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
				url: URL(string: viewModel.repository.owner?.avatarURL ?? ""),
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
			.accessibilityHidden(true)
			Text(L10n.detailsRepositoryTitle(viewModel.repository.owner?.name ?? "", viewModel.repository.name ?? ""))
				.font(.system(size: 16, weight: .medium))
				.foregroundColor(Color(Asset.Colors.Primary.text))
				.padding(.top, 14)
			Text(viewModel.repository.language ?? "")
				.font(.system(size: 14))
				.foregroundStyle(Color(Asset.Colors.Secondary.text))
				.padding(.top, 6)
		}
	}

	var infoStack: some View {
		VStack(spacing: 14) {
			forks
			GitDivider()
			issues
			GitDivider()
			starred
			GitDivider()
			lastRelease
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
			Text(viewModel.repository.forksCount?.description ?? "")
		} label: {
			Text(L10n.detailsForks)
		}
	}

	var issues: some View {
		LabeledContent {
			Text(viewModel.repository.openIssuesCount?.description ?? "")
		} label: {
			Text(L10n.detailsIssues)
		}
	}

	var starred: some View {
		LabeledContent {
			Text(viewModel.repository.stargazersCount?.description ?? "")
		} label: {
			Text(L10n.detailsStarred)
		}
	}

	var lastRelease: some View {
		LabeledContent {
			Text(viewModel.releaseVersion)
		} label: {
			Text(L10n.detailsRelease)
		}
	}
}

#Preview {
	RepositoryView(viewModel: .preview())
}
