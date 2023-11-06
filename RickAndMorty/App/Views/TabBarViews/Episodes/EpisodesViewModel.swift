//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

class EpisodesViewModel: ObservableObject {
    @Published var loading: Bool = false

    @Published var nextPage: Int?
    @Published var episodes: [Episode]?

    private let episodesWithPaginationRepository: EpisodesWithPaginationRepository

    init(episodesWithPaginationRepository: EpisodesWithPaginationRepository) {
        self.episodesWithPaginationRepository = episodesWithPaginationRepository
    }
}

extension EpisodesViewModel {
    func fetchFirstEpisodesSet() {
        self.nextPage = 1 // force to fetch the first page

        self.loading = true

        self.fetchEpisodesSet(pageNumber: nextPage) { [weak self] result in
            self?.loading = false

            switch result {
            case .success(let episodesWP):
                self?.nextPage = episodesWP.nextPage
                self?.episodes = episodesWP.episodes
            case .failure(let error):
                print("Error fetching first episodes set: \(error.localizedDescription)")
            }
        }
    }

    func fetchNextEpisodesSet() {
        guard let nextPage = nextPage else {
            return
        }

        self.fetchEpisodesSet(pageNumber: nextPage) { [weak self] result in
            switch result {
            case .success(let episodesWP):
                self?.nextPage = episodesWP.nextPage

                // Add the new episodes to the showing episodes list
                self?.episodes?.append(contentsOf: episodesWP.episodes)
            case .failure(let error):
                print("Error fetching episodes set with page (\(nextPage)): \(error.localizedDescription)")
            }
        }
    }
}

private extension EpisodesViewModel {
    func fetchEpisodesSet(
        pageNumber: Int?,
        completion: @escaping (Result<EpisodesWithPagination, Error>) -> Void
    ) {
        let episodesWithPaginationRM = EpisodesWithPaginationRequestModel(pageNumber: pageNumber)
        episodesWithPaginationRepository.getEpisodesWithPagination(
            requestModel: episodesWithPaginationRM
        ) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
