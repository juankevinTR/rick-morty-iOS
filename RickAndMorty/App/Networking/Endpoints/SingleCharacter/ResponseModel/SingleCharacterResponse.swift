//
//  SingleCharacterResponse.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

// MARK: - Response
struct SingleCharacterResponse: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: SingleCharacterLocationResponse?
    let location: SingleCharacterLocationResponse?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct SingleCharacterLocationResponse: Codable {
    let name: String
    let url: String
}

// MARK: - Mock
extension SingleCharacterResponse {
    static func getMock() -> SingleCharacterResponse {
        return SingleCharacterResponse(
            id: 0,
            name: "Mock CharacterResponse",
            status: "Alive",
            species: nil,
            type: nil,
            gender: nil,
            origin: nil,
            location: nil,
            image: nil,
            episode: nil,
            url: nil,
            created: nil
        )
    }
}
