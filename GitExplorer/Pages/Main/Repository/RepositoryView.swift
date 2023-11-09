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
		Text(repository.name ?? "")
	}
}

#Preview {
	RepositoryView(repository: .preview())
}
