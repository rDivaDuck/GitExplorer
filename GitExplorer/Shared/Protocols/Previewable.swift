//
//  Previewable.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

protocol Previewable {

	associatedtype T

	static func preview() -> T
}
