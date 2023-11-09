//
//  ApplicationCoordinator.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import UIKit
import SwiftUI
import Combine

class ApplicationCoordinator: Coordinator {

	let mainWindow: UIWindow

	private var childCoordinators = [Coordinator]()

	private var navigationController: UINavigationController?

	init(window: UIWindow) {
		self.mainWindow = window
		let contentViewController = UIHostingController(rootView: SplashView())
		navigationController = UINavigationController(rootViewController: contentViewController)
		navigationController?.navigationBar.isHidden = true
		self.mainWindow.rootViewController = navigationController
	}

	func start() {
		showMain()
	}

	private func showMain() {
		// If we don't have a navigation controller here, fatal error -RAH
		guard let navigationController = navigationController else {
			fatalError()
		}
		navigationController.dismiss(animated: true)
		let mainCoordinator = MainCoordinator(navigationController: navigationController)
		mainCoordinator.start()
		self.childCoordinators = [mainCoordinator]
	}

	/// On signout, child coordinators should not be retained,
	/// they should be allowed to deinit.
	private func resetChildCoordinators() {
		self.childCoordinators.removeAll()
	}
}
