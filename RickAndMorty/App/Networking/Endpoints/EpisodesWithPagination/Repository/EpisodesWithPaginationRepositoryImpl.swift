//
//  EpisodesWithPaginationRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

class EpisodesWithPaginationRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension EpisodesWithPaginationRepositoryImpl: EpisodesWithPaginationRepository {
    func getEpisodesWithPagination(
        requestModel: EpisodesWithPaginationRequestModel,
        completion: @escaping (Result<EpisodesWithPagination, Error>) -> Void
    ) {
        let request = EpisodesWithPaginationRequest(model: requestModel)

        networkService.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(EpisodesWithPagination.getWith(response: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
