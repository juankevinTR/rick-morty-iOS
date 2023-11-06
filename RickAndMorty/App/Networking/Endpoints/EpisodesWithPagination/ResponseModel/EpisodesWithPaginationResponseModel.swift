//
//  EpisodesWithPaginationResponseModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

// MARK: - Response
struct EpisodesWithPaginationResponse: Codable {
    let info: EpisodesWithPaginationResponseInfo?
    let results: [SingleEpisodeResponse]?
}

// MARK: - Response - Info
struct EpisodesWithPaginationResponseInfo: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
