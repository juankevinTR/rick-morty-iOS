//
//  Character.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

// MARK: - App
struct Character: Codable, Hashable {
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

enum CharacterStatus: String, Codable, Hashable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"

    static func getWith(
        response: String?
    ) -> CharacterStatus? {
        return CharacterStatus(rawValue: response ?? "")
    }

    func getLocalizedKey() -> String {
        switch self {
        case .alive: return "status_alive"
        case .dead: return "status_dead"
        case .unknown: return "status_unknown"
        }
    }
}

enum CharacterGender: String, Codable, Hashable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"

    static func getWith(
        response: String?
    ) -> CharacterGender? {
        return CharacterGender(rawValue: response ?? "")
    }
}

struct CharacterLocation: Codable, Hashable {
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

// MARK: - Mock
extension Character {
    static func getMock() -> Character {
        return Character(
            id: 0,
            name: "Juan Kevin Trujillo",
            status: CharacterStatus.alive,
            species: "Human",
            type: "",
            gender: CharacterGender.male,
            origin: CharacterLocation(
                name: "Gran Canaria",
                url: ""
            ),
            location: CharacterLocation(
                name: "Murcia",
                url: "")
            ,
            image: "",
            episode: [],
            url: "https://www.linkedin.com/in/juankevintrujillo/",
            created: "1992-09-21T00:00:00.000Z"
        )
    }
}
