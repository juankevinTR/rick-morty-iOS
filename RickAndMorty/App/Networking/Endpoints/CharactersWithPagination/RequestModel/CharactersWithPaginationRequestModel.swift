//
//  CharactersWithPaginationRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

struct CharactersWithPaginationRequestModel: Codable {
    let pageNumber: Int?

    init(pageNumber: Int? = nil) {
        self.pageNumber = pageNumber
    }
}

class CharactersWithPaginationRequest: APIRequest {
    let model: CharactersWithPaginationRequestModel

    init(model: CharactersWithPaginationRequestModel) {
        self.model = model
    }

    typealias Response = CharactersWithPaginationResponse

    var urlPathComponent: String {
        return "character"
    }

    var urlParameters: [String: String] {
        var params: [String: String] = [:]

        if let pageNumber = model.pageNumber {
            params["page"] = "\(pageNumber)"
        }

        return params
    }

    var httpMethod: HTTPMethod {
        .GET
    }

    var headers: [String: String] {
        return [:]
    }
}
