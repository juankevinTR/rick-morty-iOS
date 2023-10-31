//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case invalidResponse
    case invalidURL
    case noData
    case customError(String) // Custom error case with a localized string key

    var localizedDescription: String {
        switch self {
        case .decodingError:
            return NSLocalizedString("network_service_decoding_error", comment: "Error --> Decoding error")
        case .invalidResponse:
            return NSLocalizedString("network_service_invalid_response", comment: "Error --> Invalid response")
        case .invalidURL:
            return NSLocalizedString("network_service_invalid_url", comment: "Error --> Invalid URL")
        case .noData:
            return NSLocalizedString("network_service_no_data", comment: "Error --> No data received")
        case .customError(let key):
            return NSLocalizedString(key, comment: "")
        }
    }
}
