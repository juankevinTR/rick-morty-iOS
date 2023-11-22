//
//  CharactersWithPaginationResponse.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

// MARK: - Response
struct CharactersWithPaginationResponse: Codable {
    let info: CharactersWithPaginationResponseInfo?
    let results: [SingleCharacterResponse]?
}

// MARK: - Response - Info
struct CharactersWithPaginationResponseInfo: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
