//
//  EmptyStateView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct EmptyStateView: View {

	var body: some View {
		VStack(spacing: 0) {
			Spacer()
				.frame(maxHeight: 154)
			Image(Asset.Images.Icons.empty)
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 50)
				.padding(.bottom, 30)
			Text(L10n.searchEmptyTitle)
				.font(.system(size: 16, weight: .medium))
				.foregroundColor(Color(Asset.Colors.Primary.text))
				.padding(.bottom, 8)
			Text(L10n.searchEmptyBody)
				.font(.system(size: 14))
				.foregroundColor(Color(Asset.Colors.Secondary.text))
				.multilineTextAlignment(.center)
				.padding(.horizontal, 100)
			Spacer()
		}
	}
}

#Preview {
	EmptyStateView()
}
