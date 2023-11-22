//
//  EpisodesWithPaginationRequestModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

struct EpisodesWithPaginationRequestModel: Codable {
    let pageNumber: Int?

    init(pageNumber: Int? = nil) {
        self.pageNumber = pageNumber
    }
}

class EpisodesWithPaginationRequest: APIRequest {
    let model: EpisodesWithPaginationRequestModel

    init(model: EpisodesWithPaginationRequestModel) {
        self.model = model
    }

    typealias Response = EpisodesWithPaginationResponse

    var urlPathComponent: String {
        return "episode"
    }

    var urlParameters: [String: String] {
        var params: [String: String] = [:]

        if let pageNumber = model.pageNumber {
            params["page"] = "\(pageNumber)"
        }

        return params
    }

    var httpMethod: HTTPMethod {
        .GET
    }

    var headers: [String: String] {
        return [:]
    }
}
