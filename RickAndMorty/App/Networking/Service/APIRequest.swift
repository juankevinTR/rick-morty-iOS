//
//  APIRequest.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

// API BASE URL - GLOBAL VARIABLE
#if USE_DEVELOP_SERVICES
    let BASEAPIURL = "https://rickandmortyapi.com/api/"
#else
    let BASEAPIURL = "https://rickandmortyapi.com/api/"
#endif

enum HTTPMethod: String {
    case GET
    case POST
    // We can add other methods as post, put, delete
}

protocol APIRequest {
    associatedtype Response: Codable

    var baseURL: URL { get }
    var urlPathComponent: String { get }
    var urlParameters: [String: String] { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
    var requestHttpBody: Any { get }
}

// Default APIRequest implementation
extension APIRequest {
    var baseURL: URL {
        guard let url = URL(string: BASEAPIURL) else {
            fatalError(
                NSLocalizedString(
                    "api_request_invalid_default_base_url",
                    comment: "Error --> Default API base URL is invalid"
                )
            )
        }
        return url
    }

    var requestHttpBody: Any {
        return [] as [Any]
    }
}
