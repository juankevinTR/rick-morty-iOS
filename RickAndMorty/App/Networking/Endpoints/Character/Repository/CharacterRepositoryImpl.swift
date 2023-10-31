//
//  CharacterRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

class CharacterRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension CharacterRepositoryImpl: CharacterRepository {
    func getCharacter(
        requestModel: CharacterRequestModel,
        completion: @escaping (Result<Character, Error>) -> Void
    ) {
        let request = CharacterRequest(model: requestModel)

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
