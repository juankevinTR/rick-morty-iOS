//
//  Episode.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 5/11/23.
//

import Foundation

// MARK: - App
struct Episode: Codable, Hashable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [Int]? // Better the ids for future searching
    let url: String
    let created: String

    static func getWith(
        response: SingleEpisodeResponse
    ) -> Episode {
        return Episode(
            id: response.id ?? -1,
            name: response.name ?? "",
            airDate: response.airDate ?? "",
            episode: response.episode ?? "",
            characters: response.characters?.compactMap({ characterURL in
                self.extractCharacterId(from: characterURL)
            }),
            url: response.url ?? "",
            created: response.created ?? ""
        )
    }
}

private extension Episode {
    private static func extractCharacterId(from urlString: String) -> Int? {
        if let characterIdRange = urlString.range(of: "/character/") {
            let characterIdSubstring = urlString.suffix(from: characterIdRange.upperBound)
            if let characterId = Int(characterIdSubstring) {
                return characterId
            }
        }
        return nil
    }
}

// MARK: - Mock
extension Episode {
    static func getMock() -> Episode {
        return Episode(
            id: 0,
            name: "Mock Episode",
            airDate: "",
            episode: "ME01",
            characters: [1, 5, 8, 10, 12, 16],
            url: "https://www.linkedin.com/in/juankevintrujillo/",
            created: "1992-09-21T00:00:00.000Z"
        )
    }
}
