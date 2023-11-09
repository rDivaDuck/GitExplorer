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
	private var subscriptions = Set<AnyCancellable>()

	@ObservedObject private var splashViewModel = SplashViewModel()

	init(window: UIWindow) {
		self.mainWindow = window
		let contentViewController = UIHostingController(rootView: SplashView(viewModel: splashViewModel))
		navigationController = UINavigationController(rootViewController: contentViewController)
		navigationController?.navigationBar.isHidden = true
		self.mainWindow.rootViewController = navigationController
	}

	func start() {
		splashViewModel.$dismiss
			.compactMap { $0 }
			.filter { $0 }
			.removeDuplicates()
			.receive(on: DispatchQueue.main)
			.sink { [weak self] _ in
				self?.showMain()
			}
			.store(in: &subscriptions)
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
}
