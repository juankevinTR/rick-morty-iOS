//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 30/10/23.
//

import Foundation

protocol NetworkService {
    func executeRequest<T: APIRequest>(request: T, completion: @escaping (Result<T.Response, Error>) -> Void)
}
