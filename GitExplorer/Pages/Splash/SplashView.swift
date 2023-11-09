//
//  SplashView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct SplashView: View {

	var body: some View {
		ZStack {
			Color(Asset.Colors.Background.primary)
			Image(Asset.Images.Placeholder.rDuck)
				.resizable()
				.scaledToFit()
				.frame(width: 200)
		}
		.ignoresSafeArea(.all)
		.accessibilityHidden(true)
	}
}

#Preview {
	SplashView()
}
