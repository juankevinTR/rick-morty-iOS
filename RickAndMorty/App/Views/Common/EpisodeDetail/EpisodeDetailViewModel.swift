//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

class EpisodeDetailViewModel: ObservableObject {
    @Published var loadingCharacters: Bool = false

    @Published var id: Int?
    @Published var name: String
    @Published var airDate: String
    @Published var seasonNumber: String
    @Published var episodeNumber: String
    @Published var characters: [Character]?

    private var episode: Episode

    private let multipleCharactersRepository: MultipleCharactersRepository

    init(episode: Episode, multipleCharactersRepository: MultipleCharactersRepository) {
        self.episode = episode

        self.id = episode.id
        self.name = episode.name
        self.airDate = episode.airDate
        self.seasonNumber = String(describing: episode.seasonNumber)
        self.episodeNumber = String(describing: episode.episodeNumber)
        self.characters = []

        self.multipleCharactersRepository = multipleCharactersRepository
    }
}

extension EpisodeDetailViewModel {
    func fetchCharacters() {
        if let characterIds = episode.characterIds {
            self.loadingCharacters = true

            let multipleCharactersRM = MultipleCharactersRequestModel(
                characterIds: characterIds
            )

            multipleCharactersRepository.getCharacters(
                requestModel: multipleCharactersRM) { [weak self] result in
                    DispatchQueue.main.async {
                        self?.loadingCharacters = false

                        switch result {
                        case .success(let characters):
                            self?.characters = characters
                        case .failure(let error):
                            print("Error fetching characters: \(error.localizedDescription)")
                        }
                    }
                }
        }
    }
}
