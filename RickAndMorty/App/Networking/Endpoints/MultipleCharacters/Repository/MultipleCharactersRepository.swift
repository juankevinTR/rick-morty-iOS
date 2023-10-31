//
//  MultipleCharactersRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

protocol MultipleCharactersRepository {
    func getCharacters(requestModel: MultipleCharactersRequestModel, completion: @escaping(Result<[Character], Error>) -> Void)
}
