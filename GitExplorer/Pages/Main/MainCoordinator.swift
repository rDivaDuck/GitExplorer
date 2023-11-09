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
		let delegate = CrossFadeNavigationControllerDelegate()
		navigationController.delegate = delegate
		let mainView = SearchView(coordinator: self, viewModel: SearchViewModel())
		let mainViewController = UIHostingController(rootView: mainView)
		rootViewController = mainViewController
		navigationController.navigationBar.isHidden = false
		navigationController.setViewControllers([rootViewController], animated: true)
	}

	func present(_ repository: Repository) {
		let repositoryView = RepositoryView(coordinator: self, viewModel: RepositoryViewModel(repository))
		let viewController = UIHostingController(rootView: repositoryView)
		viewController.navigationItem.hidesBackButton = true
		navigationController.pushViewController(viewController, animated: true)
	}

	func back() {
		navigationController.popViewController(animated: true)
	}
}

extension MainCoordinator: Previewable {
	static func preview() -> MainCoordinator {
		MainCoordinator(navigationController: UINavigationController())
	}
}
