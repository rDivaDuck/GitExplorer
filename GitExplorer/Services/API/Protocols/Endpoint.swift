//
//  Endpoint.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

/// Defines a remote service with which we can communicate remotely through the `HTTP` protocol.
protocol Endpoint {

	/// The path to the endpoint on the server.
	var relativePath: String { get }

	/// Extra information that is added to the `URL` that ultimately identifies the network request.
	var parameters: [URLQueryItem]? { get }

	/// Extra information about how a request should be handled.
	var headers: [String: String] { get }
}

extension Endpoint {

	var parameters: [URLQueryItem]? { nil }
	var headers: [String: String] { [:] }
}
