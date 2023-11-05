//
//  AllCharacter.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

// MARK: - App
struct AllCharacters: Codable, Hashable {
    let totalPages: Int?
    let prevPage: Int?
    let nextPage: Int?
    let characters: [Character]

    static func getWith(
        response: AllCharactersResponse?
    ) -> AllCharacters {
        let prev: Int? = extractPageNumber(from: response?.info?.prev ?? "")
        let next: Int? = extractPageNumber(from: response?.info?.next ?? "")

        return AllCharacters(
            totalPages: response?.info?.pages,
            prevPage: prev,
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
