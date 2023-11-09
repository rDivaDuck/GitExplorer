//
//  SceneDelegate.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var applicationCoordinator: ApplicationCoordinator?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			let applicationCoordinator = ApplicationCoordinator(window: window)
			window.makeKeyAndVisible()
			applicationCoordinator.start()
			self.applicationCoordinator = applicationCoordinator
		}
	}
}
