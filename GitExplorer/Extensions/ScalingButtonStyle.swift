//
//  ScalingButtonStyle.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

public struct ScalingButtonStyle: ButtonStyle {

	let scaleEffect: CGFloat

	public func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? scaleEffect : 1)
			.animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
	}
}

public extension ButtonStyle where Self == ScalingButtonStyle {
	static var scaling: ScalingButtonStyle {
		ScalingButtonStyle(scaleEffect: 0.97)
	}
}
