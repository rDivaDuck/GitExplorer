//
//  PlaceholderIcon.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct PlaceholderIcon: View {
	var body: some View {
		Image(Asset.Images.Placeholder.icon)
			.resizable()
			.scaledToFit()
	}
}

#Preview {
	PlaceholderIcon()
}
