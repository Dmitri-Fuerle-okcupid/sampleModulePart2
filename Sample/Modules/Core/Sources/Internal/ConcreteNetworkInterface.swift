//
//  ConcreteNetworkInterface.swift
//  Sample
//
//  Created by Dmitri Fuerle on 4/12/21.
//  Copyright © 2021 OkCupid. All rights reserved.
//

import Foundation
import Interfaces

enum RestAPIClientError: Error {
    case invalidUrl
    case unknown

    var localizedDescription: String {
        switch self {
        case .invalidUrl:
            return "Invalid URL."

        case .unknown:
            return "Unknown API error."
        }
    }
}

final class ConcreteNetworkInterface {
    private let session: URLSession = URLSession.shared
    private let decoder: JSONDecoder
    private let logInterface: LogInterface
    private let authToken: String = "auth token"
    private let host: String = "host"

    // MARK: - Init

    init(logInterface: LogInterface) {
        self.logInterface = logInterface

        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
    }

    // MARK: - Private

    private func buildRequest(endpoint: Endpoint) -> URLRequest? {
        var queryItems: [URLQueryItem] = []
        switch endpoint.method {
        case .get(let parameters):
            queryItems.append(contentsOf: parameters)
        case .post: ()
        case .put: ()
        case .delete: ()
        }

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            logInterface.error("failed to build url from components")
            assert(endpoint.path.hasPrefix("/"))
            return nil
        }

        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        var headers: [String: String] = [
            "Authorization": "Bearer \(authToken)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]

        if let additionalHeaders = endpoint.additionalHeaders {
            additionalHeaders.forEach { key, value in
                headers[key] = value
            }
        }

        headers.forEach { key, value in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }

        urlRequest.httpMethod = endpoint.method.name

        switch endpoint.method {
        case .get: ()

        case .post(let data):
            urlRequest.httpBody = data

        case .put(let data):
            urlRequest.httpBody = data

        case .delete: ()
        }

        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return urlRequest
    }
}

// MARK: - RestAPIInterface

extension ConcreteNetworkInterface: NetworkInterface {
    @discardableResult
    func task<T>(endpoint: Endpoint, type: T.Type, completion: @escaping (Result<T, Error>, URLResponse?) -> Void) -> URLSessionTask? where T: Decodable {
        guard let request = buildRequest(endpoint: endpoint) else {
            completion(.failure(RestAPIClientError.invalidUrl), nil)
            return nil
        }

        let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            guard let strongSelf = self else { completion(.failure(RestAPIClientError.unknown), nil); return }

            if let data = data {
                do {
                    let decoded = try strongSelf.decoder.decode(T.self, from: data)
                    completion(.success(decoded), response)
                } catch DecodingError.dataCorrupted(let context) {
                    completion(.failure(RestAPIClientError.unknown), response)
                    strongSelf.logInterface.error("dataCorrupted: \(context)")
                } catch DecodingError.keyNotFound(let key, let context) {
                    completion(.failure(RestAPIClientError.unknown), response)
                    let data = String(decoding: data, as: UTF8.self)
                    strongSelf.logInterface.error("keyNotFound: \(key) context: \(context) data: \(data)")
                } catch DecodingError.typeMismatch(let key, let context) {
                    completion(.failure(RestAPIClientError.unknown), response)
                    let data = String(decoding: data, as: UTF8.self)
                    strongSelf.logInterface.error("typeMismatch: \(key) context: \(context) data: \(data)")
                } catch DecodingError.valueNotFound(let key, let context) {
                    completion(.failure(RestAPIClientError.unknown), response)
                    let data = String(decoding: data, as: UTF8.self)
                    strongSelf.logInterface.error("valueNotFound: \(key) context: \(context) data: \(data)")
                } catch {
                    completion(.failure(error), response)
                    let data = String(decoding: data, as: UTF8.self)
                    strongSelf.logInterface.error("error: \(error.localizedDescription) data: \(data)")
                }
            } else if let error = error {
                completion(.failure(error), response)
            } else {
                completion(.failure(RestAPIClientError.invalidUrl), response)
            }
        }

        dataTask.resume()
        return dataTask
    }
}
