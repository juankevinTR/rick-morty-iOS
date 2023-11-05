//
//  AllCharactersRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

protocol AllCharactersRepository {
    func getAllCharacters(
        requestModel: AllCharactersRequestModel,
        completion: @escaping(Result<AllCharacters, Error>) -> Void
    )
}
