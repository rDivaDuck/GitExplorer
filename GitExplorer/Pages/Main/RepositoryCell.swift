//
//  RepositoryCell.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct RepositoryCell: View {

	let repository: Repository

	var body: some View {
		HStack {
			AsyncImage(
				url: URL(string: repository.owner?.avatarURL ?? ""),
				content: { image in
					image
						.resizable()
						.scaledToFit()
						.frame(maxHeight: 42)
						.cornerRadius(6)
				},
				placeholder: {
					PlaceholderIcon()
						.frame(maxHeight: 42)
				}
			)
			VStack(alignment: .leading, spacing: 4) {
				Text(repository.name ?? "")
					.font(.system(size: 16, weight: .medium))
					.foregroundColor(Color(Asset.Colors.Primary.text))
				Text(repository.description ?? "")
					.lineLimit(1)
					.font(.system(size: 14))
					.foregroundStyle(Color(Asset.Colors.Secondary.text))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

#Preview {
	RepositoryCell(repository: .preview())
}
