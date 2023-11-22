//
//  SingleCharacterRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

class SingleCharacterRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension SingleCharacterRepositoryImpl: SingleCharacterRepository {
    func getSingleCharacter(
        requestModel: SingleCharacterRequestModel,
        completion: @escaping (Result<Character, Error>) -> Void
    ) {
        let request = SingleCharacterRequest(model: requestModel)

        networkService.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(Character.getWith(response: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
