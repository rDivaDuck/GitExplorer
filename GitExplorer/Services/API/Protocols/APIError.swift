//
//  APIError.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

/// Failure points of `API`.
enum APIError: Error {

	/// Body could not be encoded.
	case encoding(error: Error)

	/// Response could not be decoded.
	case decoding(error: Error)

	/// What went wrong in the asynchronous API communication.
	case network(error: Error)

	/// The server has returned a response that we do not handle.
	case invalidResponse

	/// The response status code does fall under the app valid values.
	case invalidResponseStatusCode(Int)

	/// Failed to parse URL.
	case unsupportedURL

	/// Failed to build URL.
	case badURL

	case unknown
}
