//
//  Double+Extensions.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import UIKit

extension Double {

	static var systemAnimationDuration: Double {
		CATransaction.animationDuration()
	}

	static var doubleSystemAnimationDuration: Double {
		systemAnimationDuration * 2
	}
}
