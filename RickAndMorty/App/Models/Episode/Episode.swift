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
