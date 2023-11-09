//
//  GitImageView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct GitImageView: View {

	let urlString: String?
	let height: CGFloat
	let cornerRadius: CGFloat = 6

	var body: some View {
		AsyncImage(
			url: URL(string: urlString ?? ""),
			content: { image in
				image
					.resizable()
					.scaledToFit()
					.frame(maxHeight: height)
					.cornerRadius(cornerRadius)
			},
			placeholder: {
				PlaceholderIcon()
					.frame(maxHeight: height)
			}
		)
	}
}

#Preview {
	GitImageView(urlString: Repository.preview().owner?.avatarURL, height: 100)
}
