//
//  AllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

// MARK: - Response
struct AllCharactersResponse: Codable {
    let info: AllCharactersResponseInfo?
    let results: [CharacterResponse]?
}

// MARK: - Response - Info
struct AllCharactersResponseInfo: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
