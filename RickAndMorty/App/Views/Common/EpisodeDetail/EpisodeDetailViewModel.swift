//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import Foundation

class EpisodeDetailViewModel: ObservableObject {
    @Published var loadingImage: Bool = false

    @Published var id: Int?
    @Published var name: String

    init(episode: Episode) {
        self.id = episode.id
        self.name = episode.name
    }
}

extension EpisodeDetailViewModel {
//    private func getImage(url: String) {
//        self.loadingImage = true
//
//        ImageLoader.shared.loadImage(from: URL(string: url)) { [weak self] loadedImage in
//            self?.image = loadedImage
//            self?.loadingImage = false
//        }
//    }
}
