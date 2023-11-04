//
//  AllCharactersRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

struct AllCharactersRequestModel: Codable {
}

class AllCharactersRequest: APIRequest {
    let model: AllCharactersRequestModel

    init(model: AllCharactersRequestModel) {
        self.model = model
    }

    typealias Response = AllCharactersResponse

    var urlPathComponent: String {
        return "character/"
    }

    var urlParameters: [String: String] {
        return [:]
    }

    var httpMethod: HTTPMethod {
        .GET
    }

    var headers: [String: String] {
        return [:]
    }
}
