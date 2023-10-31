//
//  MockCharacterRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

// Mock Character Repository
struct MockCharacterRepository: CharacterRepository {
    func getCharacter(
        requestModel: CharacterRequestModel,
        completion: @escaping (Result<Character, Error>) -> Void
    ) {
        completion(
            .success(
                Character.getWith(response: CharacterResponse.getMock())
            )
        )
    }
}
