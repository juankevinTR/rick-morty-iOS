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
    let seasonNumber: Int?
    let episodeNumber: Int?
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
            seasonNumber: getSeasonNumber(from: response.episode),
            episodeNumber: getEpisodeNumber(from: response.episode),
            characters: response.characters?.compactMap({ characterURL in
                self.extractCharacterId(from: characterURL)
            }),
            url: response.url ?? "",
            created: response.created ?? ""
        )
    }
}

private extension Episode {
    private static func getSeasonNumber(from input: String?) -> Int? {
        guard let input = input, let range = input.range(of: "S") else {
            return nil
        }
        let startIndex = input.index(after: range.upperBound)
        let seasonNumber = input[startIndex...]
        return Int(seasonNumber)
    }

    private static func getEpisodeNumber(from input: String?) -> Int? {
        guard let input = input, let range = input.range(of: "E") else {
            return nil
        }
        let startIndex = input.index(after: range.upperBound)
        let episodeNumber = input[startIndex...]
        return Int(episodeNumber)
    }

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
            seasonNumber: 1,
            episodeNumber: 1,
            characters: [1, 5, 8, 10, 12, 16],
            url: "https://www.linkedin.com/in/juankevintrujillo/",
            created: "1992-09-21T00:00:00.000Z"
        )
    }

    static func getMockOriginalData() -> Episode {
        return Episode(
            id: 28,
            name: "The Ricklantis Mixup",
            airDate: "September 10, 2017", 
            seasonNumber: 3,
            episodeNumber: 7,
            characters: [1, 2],
            url: "https://rickandmortyapi.com/api/episode/28",
            created: "2017-11-10T12:56:36.618Z"
        )
    }
}
