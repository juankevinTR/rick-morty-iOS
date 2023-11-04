//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
//    @Published var loading: Bool = false
    @Published var characters: [Character]?

    private let allCharactersRepository: AllCharactersRepository

    init(allCharactersRepository: AllCharactersRepository) {
        self.allCharactersRepository = allCharactersRepository
    }
}

extension CharactersViewModel {
    func fetchAllCharacters() {
//        self.loading = true

        let allCharactersRM = AllCharactersRequestModel()

        allCharactersRepository.getAllCharacters(requestModel: allCharactersRM) { [weak self] result in
            DispatchQueue.main.async {
//                self?.loading = false

                switch result {
                case .success(let allCharacters):
                    self?.characters = allCharacters.characters
                case .failure(let error):
                    print("Error fetching characters: \(error.localizedDescription)")
                }
            }
        }
    }
}
