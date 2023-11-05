//
//  SingleEpisodeResponse.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 5/11/23.
//

import Foundation

// MARK: - Response
struct SingleEpisodeResponse: Codable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
}

// MARK: - Mock
extension SingleEpisodeResponse {
    static func getMock() -> SingleEpisodeResponse {
        return SingleEpisodeResponse(
            id: 0,
            name: "Mock SingleEpisodeResponse",
            airDate: nil,
            episode: "Mock S03E07",
            characters: nil,
            url: nil,
            created: nil
        )
    }
}
