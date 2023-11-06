//
//  CharactersWithPaginationRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

protocol CharactersWithPaginationRepository {
    func getCharactersWithPagination(
        requestModel: CharactersWithPaginationRequestModel,
        completion: @escaping(Result<CharactersWithPagination, Error>) -> Void
    )
}
