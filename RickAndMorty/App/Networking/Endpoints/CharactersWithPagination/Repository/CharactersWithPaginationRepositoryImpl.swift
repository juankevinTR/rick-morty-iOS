//
//  CharactersWithPaginationRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

class CharactersWithPaginationRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension CharactersWithPaginationRepositoryImpl: CharactersWithPaginationRepository {
    func getCharactersWithPagination(
        requestModel: CharactersWithPaginationRequestModel,
        completion: @escaping (Result<CharactersWithPagination, Error>) -> Void
    ) {
        let request = CharactersWithPaginationRequest(model: requestModel)

        networkService.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(CharactersWithPagination.getWith(response: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
