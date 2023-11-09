//
//  Result+Extensions.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

extension Result where Failure == APIError {
	static func catching(_ expression: () async throws -> Success) async -> Result<Success, Failure> {
		do {
			let result = try await expression()
			return .success(result)
		} catch let error as APIError {
			return .failure(error)
		} catch {
			return .failure(APIError.unknown)
		}
	}
}
