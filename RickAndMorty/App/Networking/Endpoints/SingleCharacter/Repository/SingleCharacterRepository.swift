//
//  SingleCharacterRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

protocol SingleCharacterRepository {
    func getSingleCharacter(requestModel: SingleCharacterRequestModel, completion: @escaping(Result<Character, Error>) -> Void)
}
