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

    private let charactersWithPaginationRepository: CharactersWithPaginationRepository

    init(charactersWithPaginationRepository: CharactersWithPaginationRepository) {
        self.charactersWithPaginationRepository = charactersWithPaginationRepository
    }
}

extension CharactersViewModel {
    func fetchFirstCharactersSet() {
        self.nextPage = 1 // force to fetch the first page

        self.loading = true

        self.fetchCharactersSet(pageNumber: nextPage) { [weak self] result in
            self?.loading = false

            switch result {
            case .success(let charactersWP):
                self?.nextPage = charactersWP.nextPage
                self?.characters = charactersWP.characters
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
            case .success(let charactersWP):
                self?.nextPage = charactersWP.nextPage

                // Add the new characters to the showing characters list
                self?.characters?.append(contentsOf: charactersWP.characters)
            case .failure(let error):
                print("Error fetching characters set with page (\(nextPage)): \(error.localizedDescription)")
            }
        }
    }
}

private extension CharactersViewModel {
    func fetchCharactersSet(
        pageNumber: Int?,
        completion: @escaping (Result<CharactersWithPagination, Error>) -> Void
    ) {
        let charactersWithPaginationRM = CharactersWithPaginationRequestModel(pageNumber: pageNumber)
        charactersWithPaginationRepository.getCharactersWithPagination(
            requestModel: charactersWithPaginationRM
        ) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
