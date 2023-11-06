//
//  SingleEpisodeRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 5/11/23.
//

import Foundation

class SingleEpisodeRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension SingleEpisodeRepositoryImpl: SingleEpisodeRepository {
    func getSingleEpisode(
        requestModel: SingleEpisodeRequestModel,
        completion: @escaping (Result<Episode, Error>) -> Void
    ) {
        let request = SingleEpisodeRequest(model: requestModel)

        networkService.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(Episode.getWith(response: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
