//
//  CaseNavigable.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

protocol CaseNavigable: CaseIterable, Equatable {
	func next() -> Self?
	func previous() -> Self?
}

extension CaseNavigable {
	func next() -> Self? {
		guard let currentIndex = Self.allCases.firstIndex(of: self) else { return nil }
		let nextIndex = Self.allCases.index(after: currentIndex)
		return Self.allCases.indices.contains(nextIndex) ? Self.allCases[nextIndex] : nil
	}

	func previous() -> Self? {
		guard let currentIndex = Self.allCases.firstIndex(of: self) else { return nil }
		let previousIndex = Self.allCases.index(currentIndex, offsetBy: -1, limitedBy: Self.allCases.startIndex)
		return previousIndex != nil ? Self.allCases[previousIndex!] : nil
	}
}
