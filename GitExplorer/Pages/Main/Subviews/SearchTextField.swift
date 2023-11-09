//
//  SearchTextField.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct SearchTextField: View {

	@Binding var searchText: String

	var body: some View {
		HStack {
			Image(Asset.Images.Icons.spyglass)
				.padding(.horizontal, 15)
			TextField(text: $searchText) {
				Text(L10n.searchPrompt)
			}
			.frame(maxWidth: .infinity)
		}
		.padding(.vertical, 14)
		.background {
			Color(Asset.Colors.Primary.search)
		}
		.cornerRadius(6)
	}
}
#Preview {
	SearchTextField(searchText: .constant(""))
}
