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
		let mainView = MainView(coordinator: self, viewModel: MainViewModel())
		let mainViewController = UIHostingController(rootView: mainView)
		rootViewController = mainViewController
		navigationController.navigationBar.isHidden = false
		navigationController.setViewControllers([rootViewController], animated: false)
	}

	func showRepo(with color: Color) {
		let repoView = RepositoryView(color: color)
		let viewController = UIHostingController(rootView: repoView)
		viewController.navigationItem.backButtonDisplayMode = .default
		navigationController.pushViewController(viewController, animated: true)
	}
}
