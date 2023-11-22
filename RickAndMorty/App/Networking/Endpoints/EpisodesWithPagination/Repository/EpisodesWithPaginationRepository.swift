//
//  EpisodesWithPaginationRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

protocol EpisodesWithPaginationRepository {
    func getEpisodesWithPagination(
        requestModel: EpisodesWithPaginationRequestModel,
        completion: @escaping(Result<EpisodesWithPagination, Error>) -> Void
    )
}
