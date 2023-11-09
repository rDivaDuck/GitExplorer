//
//  SplashView.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

struct SplashView: View {

	@ObservedObject var viewModel: SplashViewModel

	var body: some View {
		ZStack {
			Color(Asset.Colors.Primary.background)
			Image(Asset.Images.Placeholder.rDuck)
				.resizable()
				.scaledToFit()
				.frame(height: 149)
		}
		.ignoresSafeArea(.all)
		.accessibilityHidden(true)
		.task {
			await viewModel.fetch()
		}
	}
}

#Preview {
	SplashView(viewModel: .preview())
}
