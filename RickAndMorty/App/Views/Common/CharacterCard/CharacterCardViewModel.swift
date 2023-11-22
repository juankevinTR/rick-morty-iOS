//
//  CharacterCardViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation
import SwiftUI

class CharacterCardViewModel: ObservableObject {
    @Published var loadingImage: Bool = false

    @Published var name: String
    @Published var status: CharacterStatus
    @Published var species: String
    @Published var image: Image

    init(character: Character) {
        self.name = character.name
        self.status = character.status ?? .unknown
        self.species = character.species
        self.image = Constants.defaultNoImage

        if let characterImage = character.image {
            self.getImage(url: characterImage)
        }
    }
}

extension CharacterCardViewModel {
    private func getImage(url: String) {
        self.loadingImage = true

        ImageLoader.shared.loadImage(from: URL(string: url)) { [weak self] loadedImage in
            self?.image = loadedImage
            self?.loadingImage = false
        }
    }
}
