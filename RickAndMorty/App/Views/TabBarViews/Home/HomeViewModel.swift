//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var loading: Bool = false
    @Published var characters: [Character]?

    private let multipleCharactersRepository: MultipleCharactersRepository

    init(multipleCharactersRepository: MultipleCharactersRepository) {
        self.multipleCharactersRepository = multipleCharactersRepository
    }
}

extension HomeViewModel {
    func fetchRandomCharacters() {
        self.loading = true

        let randomCharacterIds: [Int] = (1...6).map({_ in Int.random(in: 1...99)})
        let multipleCharactersRM = MultipleCharactersRequestModel(
            characterIds: randomCharacterIds
        )

        multipleCharactersRepository.getCharacters(
            requestModel: multipleCharactersRM) { result in
                DispatchQueue.main.async {
                    self.loading = false

                    switch result {
                    case .success(let characters):
                        self.characters = characters
                    case .failure(let error):
                        print("Error fetching characters: \(error.localizedDescription)")
                    }
                }
            }
    }
}
