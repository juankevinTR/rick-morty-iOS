//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

protocol CharacterRepository {
    func getCharacter(requestModel: CharacterRequestModel, completion: @escaping(Result<Character, Error>) -> Void)
}
