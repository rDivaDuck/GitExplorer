//
//  HTTPMethod.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

/// Method defined in the `HTTP` protocol for interacting with remote sources.
enum HTTPMethod: String {

	/// The `GET` method requests a representation of the specified resource.
	/// Requests using `GET` should only retrieve data.
	case get = "GET"

	/// The `POST` method submits an entity to the specified resource,
	/// often causing a change in state or side effects on the server.
	case post = "POST"

	/// The `PUT` method replaces all current representations of the target resource with the request payload.
	case put = "PUT"

	/// The `DELETE` method deletes the specified resource.
	case delete = "DELETE"
}
