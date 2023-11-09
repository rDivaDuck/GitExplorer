//
//  MainCoordinator.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import SwiftUI

class MainCoordinator: NSObject, Coordinator {

	let navigationController: UINavigationController

	var rootViewController: UIViewController

	var childCoordinators = [Coordinator]()

	init(navigationController: UINavigationController) {
		self.rootViewController = UIViewController()
		self.navigationController = navigationController

		super.init()
	}

	func start() {
		showMain()
	}

	func showMain() {
		let mainView = Color.blue.ignoresSafeArea()
		let mainViewController = UIHostingController(rootView: mainView)
		rootViewController = mainViewController
		navigationController.navigationBar.prefersLargeTitles = true
		navigationController.setViewControllers([rootViewController], animated: false)
	}
}
