//
//  CharacterRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

struct SingleCharacterRequestModel: Codable {
    let characterId: Int
}

class SingleCharacterRequest: APIRequest {
    let model: SingleCharacterRequestModel

    init(model: SingleCharacterRequestModel) {
        self.model = model
    }

    typealias Response = SingleCharacterResponse

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
