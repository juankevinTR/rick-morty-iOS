//
//  AllCharactersRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

class AllCharactersRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension AllCharactersRepositoryImpl: AllCharactersRepository {
    func getAllCharacters(
        requestModel: AllCharactersRequestModel,
        completion: @escaping (Result<AllCharacters, Error>) -> Void
    ) {
        let request = AllCharactersRequest(model: requestModel)

        networkService.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(AllCharacters.getWith(response: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
