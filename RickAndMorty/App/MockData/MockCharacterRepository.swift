//
//  MockCharacterRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

// Mock Character Repository
struct MockSingleCharacterRepository: SingleCharacterRepository {
    func getSingleCharacter(
        requestModel: SingleCharacterRequestModel,
        completion: @escaping (Result<Character, Error>) -> Void
    ) {
        completion(
            .success(
                Character.getWith(response: SingleCharacterResponse.getMock())
            )
        )
    }
}
