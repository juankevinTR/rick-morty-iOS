//
//  CharacterRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

struct CharacterRequestModel: Codable {
    let characterId: Int
}

class CharacterRequest: APIRequest {
    let model: CharacterRequestModel

    init(model: CharacterRequestModel) {
        self.model = model
    }

    typealias Response = CharacterResponse

    var urlPathComponent: String {
        return "character/\(model.characterId)"
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
