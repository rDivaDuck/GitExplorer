//
//  Color+Extensions.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

extension Color {
	init(_ asset: ColorAsset) {
		self = Color(asset: asset)
	}

	static func random() -> Color {
		Color(
			red: CGFloat.random(in: 0...1),
			green: CGFloat.random(in: 0...1),
			blue: CGFloat.random(in: 0...1)
		)
	}
}
