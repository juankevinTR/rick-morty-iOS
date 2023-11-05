//
//  AllCharactersRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

struct AllCharactersRequestModel: Codable {
    let pageNumber: Int?

    init(pageNumber: Int? = nil) {
        self.pageNumber = pageNumber
    }
}

class AllCharactersRequest: APIRequest {
    let model: AllCharactersRequestModel

    init(model: AllCharactersRequestModel) {
        self.model = model
    }

    typealias Response = AllCharactersResponse

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
