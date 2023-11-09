//
//  GitDivider.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct GitDivider: View {
	var body: some View {
		Divider()
			.tint(Color(Asset.Colors.Primary.divider))
	}
}

#Preview {
	GitDivider()
}
