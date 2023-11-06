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
    let characterIds: [Int]? // Better the ids for future searching
    let url: String
    let created: String

    static func getWith(
        response: SingleEpisodeResponse
    ) -> Episode {
        return Episode(
            id: response.id ?? -1,
            name: response.name ?? "",
            airDate: response.airDate ?? "",
            seasonNumber: extractSeasonNumber(from: response.episode),
            episodeNumber: extractEpisodeNumber(from: response.episode),
            characterIds: response.characters?.compactMap({ characterURL in
                Character.extractCharacterId(from: characterURL)
            }),
            url: response.url ?? "",
            created: response.created ?? ""
        )
    }
}

// MARK: - Public extension
extension Episode {

    // MARK: - Extract function
    static func extractCharacterId(from urlString: String) -> Int? {
        if let episodeIdRange = urlString.range(of: "/episode/") {
            let episodeIdSubstring = urlString.suffix(from: episodeIdRange.upperBound)
            return Int(episodeIdSubstring)
        }
        return nil
    }

    // MARK: - Mocks
    static func getMock() -> Episode {
        return Episode(
            id: 0,
            name: "Mock Episode",
            airDate: "",
            seasonNumber: 1,
            episodeNumber: 1,
            characterIds: [1, 5, 8, 10, 12, 16],
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
            characterIds: [1, 2],
            url: "https://rickandmortyapi.com/api/episode/28",
            created: "2017-11-10T12:56:36.618Z"
        )
    }
}

// MARK: - Private extension
private extension Episode {
    static func extractSeasonNumber(from input: String?) -> Int? {
        guard let input = input, let range = input.range(of: "S") else {
            return nil
        }
        let startIndex = input.index(after: range.upperBound)

        // Find the end index by searching for the next non-numeric character
        let endIndex = input[startIndex...].firstIndex { !$0.isNumber } ?? input.endIndex

        let seasonNumber = input[startIndex..<endIndex]
        return Int(seasonNumber)
    }

    static func extractEpisodeNumber(from input: String?) -> Int? {
        guard let input = input, let range = input.range(of: "E") else {
            return nil
        }
        let startIndex = input.index(after: range.upperBound)
        let episodeNumber = input[startIndex...]
        return Int(episodeNumber)
    }
}
