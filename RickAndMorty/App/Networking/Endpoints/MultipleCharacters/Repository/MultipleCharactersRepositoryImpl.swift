//
//  MultipleCharactersRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

class MultipleCharactersRepositoryImpl {
    private let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension MultipleCharactersRepositoryImpl: MultipleCharactersRepository {
    func getCharacters(
        requestModel: MultipleCharactersRequestModel,
        completion: @escaping (Result<[Character], Error>) -> Void
    ) {
        let request = MultipleCharactersRequest(model: requestModel)

        networkService.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                let characters: [Character] = data.compactMap { characterResponse in
                    Character.getWith(response: characterResponse)
                }
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
