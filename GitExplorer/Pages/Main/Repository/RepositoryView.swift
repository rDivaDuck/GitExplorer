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
		VStack {
			header
			infoStack
			Spacer()
		}
	}

	var header: some View {
		Image(systemName: "pencil.circle.fill")
			.resizable()
			.scaledToFit()
			.frame(height: 150)
	}

	var infoStack: some View {
		VStack {
			Text("Forks")
			Divider()
			Text("Forks")
			Divider()
			Text("Forks")
			Divider()
			Text("Forks")
		}
	}
}

#Preview {
	RepositoryView(repository: .preview())
}
