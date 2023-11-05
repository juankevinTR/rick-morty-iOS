//
//  CharactersWithPagination.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

// MARK: - App
struct CharactersWithPagination: Codable, Hashable {
    let nextPage: Int?
    let characters: [Character]

    static func getWith(
        response: CharactersWithPaginationResponse?
    ) -> CharactersWithPagination {
        let next: Int? = extractPageNumber(from: response?.info?.next ?? "")

        return CharactersWithPagination(
            nextPage: next,
            characters: response?.results?.compactMap({ characterResponse in
                Character.getWith(response: characterResponse)
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

