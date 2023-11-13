//
//  SingleEpisodeRepository.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 5/11/23.
//

import Foundation

protocol SingleEpisodeRepository {
    func getSingleEpisode(
        requestModel: SingleEpisodeRequestModel,
        completion: @escaping(Result<Episode, Error>) -> Void
    )
}
