//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 4/11/23.
//

import Foundation
import SwiftUI

class ImageLoader {
    static let shared = ImageLoader()

    private init() {}

    func loadImage(from url: URL?, completion: @escaping (Image) -> Void) {
        guard let url = url else {
            completion(Constants.defaultNoImage)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let uiImage = UIImage(data: data) {
                let image = Image(uiImage: uiImage)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                // If data cannot be parsed or an error occurs, return the default image
                DispatchQueue.main.async {
                    completion(Constants.defaultNoImage)
                }
            }
        }.resume()
    }
}
