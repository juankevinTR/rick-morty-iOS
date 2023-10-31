//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var loading: Bool = false
    @Published var character: Character?

    private let characterRepository: CharacterRepository

    init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    }

    func fetchCharacter(characterId: Int) {
        self.loading = true
        let charecterRequestModel = CharacterRequestModel(characterId: characterId)

        characterRepository.getCharacter(requestModel: charecterRequestModel) { result in
            DispatchQueue.main.async {
                self.loading = false

                switch result {
                case .success(let character):
                    self.character = character
                case .failure(let error):
                    print("Error fetching character: \(error.localizedDescription)")
                }
            }
        }
    }
}
