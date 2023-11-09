//
//  CrossFadeNavigationControllerDelegate.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import UIKit

class CrossFadeNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
	func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromViewController: UIViewController, to toViewController: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		CrossFadeAnimator()
	}
}

class CrossFadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {

	let animationDuration: TimeInterval = .systemAnimationDuration

	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		animationDuration
	}

	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let toViewController = transitionContext.viewController(forKey: .to) else { return }
		toViewController.view.alpha = 0.0
		transitionContext.containerView.addSubview(toViewController.view)
		UIView.animate(withDuration: animationDuration, animations: {
			toViewController.view.alpha = 1.0
		}, completion: { _ in
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
		})
	}
}
