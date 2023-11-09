//
//  API.swift
//  GitExplorer
//
//  Copyright © 2023 Rasmus Hilleke.
//

import Foundation

/// Handles a specific subset of capabilities of a remote service and its corresponding `Endpoints` made available to interact with via `HTTP requests`.
protocol API {

	/// Valid `URL` string that identifies the service.
	static var baseURL: URL { get }

	/// Used to perform requests through.
	static var session: URLSession { get }

	/// All the `valid values` that a response `status code` can have.
	static var validResponseRange: Range<Int> { get }

	/// Used to decode the json objects
	static var jsonDecoder: JSONDecoder { get }

	/// Used to encode the json objects
	static var jsonEncoder: JSONEncoder { get }
}

extension API {

	static var session: URLSession {
		.shared
	}

	static var validResponseRange: Range<Int> {
		200..<300
	}

	/// **Fetches** data without doing any side effects.
	/// - Parameter endpoint: Identifies where the fetch request will be made how.
	static func get<R: Decodable>(from endpoint: Endpoint) async throws -> R {
		try await execute(request: try request(for: endpoint, method: .get))
	}

	/// **Creates** new data on the server.
	/// - Parameters:
	///   - object: Aggregates all the information that will be created.
	///   - endpoint: Identifies where the creation request will be made how.
	static func post<R: Decodable, B: Encodable>(_ object: B, at endpoint: Endpoint) async throws -> R {
		try await execute(
			request: try request(for: endpoint, object: object, method: .post)
		)
	}

	/// **Creates** new data on the server.
	/// - Parameters:
	///   - object: Aggregates all the information that will be created.
	///   - endpoint: Identifies where the creation request will be made how.
	static func post<B: Encodable>(_ object: B, at endpoint: Endpoint) async throws {
		try await execute(
			request: try request(for: endpoint, object: object, method: .post)
		)
	}

	/// **Creates** new data on the server.
	/// - Parameter endpoint: Identifies where the creation request will be made how.
	static func post<R: Decodable>(at endpoint: Endpoint) async throws -> R {
		try await execute(request: try request(for: endpoint, method: .post))
	}

	/// **Updates** new data on the server.
	/// - Parameters:
	///   - object: Aggregates all the information that will be updated.
	///   - endpoint: Identifies where the update request will be made how.
	static func put<R: Decodable, B: Encodable>(_ object: B, at endpoint: Endpoint) async throws -> R {
		try await execute(
			request: try request(for: endpoint, object: object, method: .put)
		)
	}

	/// **Updates** new data on the server.
	/// - Parameters:
	///   - object: Aggregates all the information that will be updated.
	///   - endpoint: Identifies where the update request will be made how.
	static func put<B: Encodable>(_ object: B, at endpoint: Endpoint) async throws {
		try await execute(
			request: try request(for: endpoint, object: object, method: .put)
		)
	}

	/// **Deletes** data from the server.
	/// - Parameter endpoint: Identifies where the deletion request will be made how.
	static func delete<R: Decodable>(from endpoint: Endpoint) async throws -> R {
		try await execute(
			request: try request(for: endpoint, method: .delete)
		)
	}

	/// **Deletes** data from the server.
	/// - Parameter endpoint: Identifies where the deletion request will be made how.
	static func delete(from endpoint: Endpoint) async throws {
		try await execute(
			request: try request(for: endpoint, method: .delete)
		)
	}

	// MARK: - Private interface.

	/// Builds a `HTTP request` to which it adds the object as `body`.
	/// - Parameters:
	///   - endpoint: Identifies where the request will be made how.
	///   - object: Representation of the `body`.
	///   - method: How the request will be performed.
	/// - Returns: Contains all the required information to perform an asynchronous `HTTP` method.
	private static func request<E: Encodable>(for endpoint: Endpoint, object: E, method: HTTPMethod) throws -> URLRequest {
		var baseRequest = try request(for: endpoint, method: method)
		do {
			baseRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
			baseRequest.httpBody = try jsonEncoder.encode(object)
		} catch {
			throw APIError.encoding(error: error)
		}
		return baseRequest
	}

	/// Builds a simple `HTTP request`.
	/// - Parameters:
	///   - endpoint: Identifies where the request will be made how.
	///   - object: Representation of the `body`.
	///   - method: How the request will be performed.
	/// - Returns: Contains all the required information to perform an asynchronous `HTTP` method.
	private static func request(for endpoint: Endpoint, method: HTTPMethod) throws -> URLRequest {
		// Build the URL and create a request.
		let fullURL: URL
		if #available(iOS 16.0, *) {
			fullURL = baseURL.appending(path: endpoint.relativePath)
		} else {
			fullURL = baseURL.appendingPathComponent(endpoint.relativePath)
		}
		guard var components = URLComponents(url: fullURL, resolvingAgainstBaseURL: true) else {
			throw APIError.unsupportedURL
		}
		components.queryItems = endpoint.parameters
		guard let url = components.url else {
			throw APIError.badURL
		}
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue
		return request
	}

	/// `Starts` an asynchronous call and `awaits` for the response.
	/// Handles response validation.
	/// - Parameter request: Contains all the required information to perform an asynchronous `HTTP` method.
	/// - Returns: Decoded response model.
	private static func execute<R: Decodable>(request: URLRequest) async throws -> R {
		let (data, response): (Data, URLResponse)
		do {
			(data, response) = try await session.data(for: request)
		} catch {
			throw APIError.network(error: error)
		}

		// Validate the response.
		guard let response = response as? HTTPURLResponse else {
			throw APIError.invalidResponse
		}
		guard validResponseRange.contains(response.statusCode) else {
			throw APIError.invalidResponseStatusCode(response.statusCode)
		}

		do {
			//			print("***", data.formattedJSON)
			return try jsonDecoder.decode(R.self, from: data)
		} catch {
			throw APIError.decoding(error: error)
		}
	}

	/// `Starts` an asynchronous call and `awaits` for the response.
	/// Throws error if the call fails.
	/// - Parameter request: Contains all the required information to perform an asynchronous `HTTP` method.
	private static func execute(request: URLRequest) async throws {
		let (_, response): (Data, URLResponse)
		do {
			(_, response) = try await session.data(for: request)
		} catch {
			throw APIError.network(error: error)
		}

		// Validate the response.
		guard let response = response as? HTTPURLResponse else {
			throw APIError.invalidResponse
		}

		guard validResponseRange.contains(response.statusCode) else {
			throw APIError.invalidResponseStatusCode(response.statusCode)
		}
	}
}
