//
//  MultipleCharactersRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

struct MultipleCharactersRequestModel: Codable {
    let characterIds: [Int]
}

class MultipleCharactersRequest: APIRequest {
    let model: MultipleCharactersRequestModel

    init(model: MultipleCharactersRequestModel) {
        self.model = model
    }

    typealias Response = [SingleCharacterResponse]

    var urlPathComponent: String {
        return "character/\(model.characterIds)"
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
