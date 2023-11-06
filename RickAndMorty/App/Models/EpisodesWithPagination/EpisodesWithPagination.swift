//
//  EpisodesWithPagination.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

struct EpisodesWithPagination: Codable, Hashable {
    let nextPage: Int?
    let episodes: [Episode]

    static func getWith(
        response: EpisodesWithPaginationResponse?
    ) -> EpisodesWithPagination {
        let next: Int? = extractPageNumber(from: response?.info?.next ?? "")

        return EpisodesWithPagination(
            nextPage: next,
            episodes: response?.results?.compactMap({ episodeResponse in
                Episode.getWith(response: episodeResponse)
            }) ?? []
        )
    }

    private static func extractPageNumber(from urlString: String) -> Int? {
        if let pageRange = urlString.range(of: "page=") {
            let pageNumberSubstring = urlString.suffix(from: pageRange.upperBound)
            if let pageNumber = Int(pageNumberSubstring) {
                return pageNumber
            }
        }
        return nil
    }
}
