//
//  CharacterImageViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation
import SwiftUI

class CharacterImageViewModel: ObservableObject {
    @Published var loadingImage: Bool = false
    @Published var image: Image

    init(character: Character) {
        self.image = Constants.defaultNoImage

        if let characterImage = character.image {
            self.getImage(url: characterImage)
        }
    }
}

extension CharacterImageViewModel {
    private func getImage(url: String) {
        self.loadingImage = true

        ImageLoader.shared.loadImage(from: URL(string: url)) { [weak self] loadedImage in
            self?.image = loadedImage
            self?.loadingImage = false
        }
    }
}
