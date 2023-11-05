//
//  SingleEpisodeRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 5/11/23.
//

import Foundation

struct SingleEpisodeRequestModel: Codable {
    let episodeId: Int
}

class SingleEpisodeRequest: APIRequest {
    let model: SingleEpisodeRequestModel

    init(model: SingleEpisodeRequestModel) {
        self.model = model
    }

    typealias Response = SingleEpisodeResponse

    var urlPathComponent: String {
        return "episode/\(model.episodeId)"
    }

    var urlParameters: [String: String] {
        return [:]
    }

    var httpMethod: HTTPMethod {
        .GET
    }

    var headers: [String: String] {
        return [:]
    }
}

