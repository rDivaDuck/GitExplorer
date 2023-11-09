//
//  SplashViewModel.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

class SplashViewModel: ObservableObject {

	@Published var dismiss: Bool?

	@MainActor
	func fetch() async {
		try? await Task.sleep(for: .seconds(0.1))
		self.dismiss = true
	}
}

extension SplashViewModel: Previewable {
	static func preview() -> SplashViewModel {
		SplashViewModel()
	}
}
