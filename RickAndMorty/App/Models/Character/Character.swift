//
//  Character.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

// MARK: - App
struct Character: Codable {
    let id: Int?
    let name: String
    let status: CharacterStatus?
    let species: String
    let type: String
    let gender: CharacterGender?
    let origin: CharacterLocation
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String

    static func getWith(
        response: CharacterResponse
    ) -> Character {
        return Character(
            id: response.id,
            name: response.name ?? "",
            status: CharacterStatus.getWith(response: response.status),
            species: response.species ?? "",
            type: response.type ?? "",
            gender: CharacterGender.getWith(response: response.gender),
            origin: CharacterLocation.getWith(response: response.origin),
            location: CharacterLocation.getWith(response: response.location),
            image: response.image ?? "",
            episode: response.episode ?? [],
            url: response.url ?? "",
            created: response.created ?? ""
        )
    }
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"

    static func getWith(
        response: String?
    ) -> CharacterStatus? {
        return CharacterStatus(rawValue: response ?? "")
    }
}

enum CharacterGender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"

    static func getWith(
        response: String?
    ) -> CharacterGender? {
        return CharacterGender(rawValue: response ?? "")
    }
}

struct CharacterLocation: Codable {
    let name: String
    let url: String

    static func getWith(
        response: CharacterLocationResponse?
    ) -> CharacterLocation {
        return CharacterLocation(
            name: response?.name ?? "",
            url: response?.url ?? ""
        )
    }
}
