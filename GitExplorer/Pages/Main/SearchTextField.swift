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
			Image(systemName: "magnifyingglass")
			TextField(text: $searchText) {
				Text("Search for repository")
			}
			.frame(maxWidth: .infinity)
		}
		.padding(8)
		.background {
			Color(Asset.Colors.Primary.search)
		}
		.cornerRadius(6)
	}
}
#Preview {
	SearchTextField(searchText: .constant(""))
}
