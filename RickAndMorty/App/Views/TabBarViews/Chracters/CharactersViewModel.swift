//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var loading: Bool = false

    @Published var nextPage: Int?
    @Published var characters: [Character]?

    private let allCharactersRepository: AllCharactersRepository

    init(allCharactersRepository: AllCharactersRepository) {
        self.allCharactersRepository = allCharactersRepository
    }
}

extension CharactersViewModel {
    func fetchFirstCharactersSet() {
        self.nextPage = 1 // force to fetch the first page

        self.loading = true

        self.fetchCharactersSet(pageNumber: nextPage) { [weak self] result in
            self?.loading = false

            switch result {
            case .success(let allCharacters):
                self?.nextPage = allCharacters.nextPage
                self?.characters = allCharacters.characters
            case .failure(let error):
                print("Error fetching first characters set: \(error.localizedDescription)")
            }
        }
    }

    func fetchNextCharactersSet() {
        guard let nextPage = nextPage else {
            return
        }

        self.fetchCharactersSet(pageNumber: nextPage) { [weak self] result in
            switch result {
            case .success(let allCharacters):
                self?.nextPage = allCharacters.nextPage

                // Add the new characters to the showing characters list
                self?.characters?.append(contentsOf: allCharacters.characters)
            case .failure(let error):
                print("Error fetching characters set with page (\(nextPage)): \(error.localizedDescription)")
            }
        }
    }
}

private extension CharactersViewModel {
    func fetchCharactersSet(
        pageNumber: Int?,
        completion: @escaping (Result<AllCharacters, Error>) -> Void
    ) {
        let allCharactersRM = AllCharactersRequestModel(pageNumber: pageNumber)
        allCharactersRepository.getAllCharacters(requestModel: allCharactersRM) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
