//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var loadingImage: Bool = false

    @Published var id: Int?
    @Published var name: String
    @Published var status: CharacterStatus
    @Published var species: String
    @Published var type: String
    @Published var gender: CharacterGender
    @Published var originName: String
    @Published var lastLocationName: String
    @Published var episodes: [String]
    @Published var image: Image

    init(character: Character) {
        self.id = character.id
        self.name = character.name
        self.status = character.status ?? .unknown
        self.species = character.species
        self.type = character.type
        self.gender = character.gender ?? .unknown
        self.originName = character.origin.name
        self.lastLocationName = character.location.name
        self.episodes = character.episodes
        self.image = Constants.defaultNoImage

        if let characterImage = character.image {
            self.getImage(url: characterImage)
        }
    }
}

extension CharacterDetailViewModel {
    private func getImage(url: String) {
        self.loadingImage = true

        ImageLoader.shared.loadImage(from: URL(string: url)) { [weak self] loadedImage in
            self?.image = loadedImage
            self?.loadingImage = false
        }
    }
}
