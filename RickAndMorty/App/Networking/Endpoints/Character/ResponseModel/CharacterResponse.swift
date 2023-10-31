//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

// MARK: - Response
struct CharacterResponse: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: CharacterLocationResponse?
    let location: CharacterLocationResponse?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct CharacterLocationResponse: Codable {
    let name: String
    let url: String
}
