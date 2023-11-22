//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import SwiftUI

struct CharacterImageView: View {
    @StateObject private var viewModel: CharacterImageViewModel

    init(character: Character) {
        self._viewModel = StateObject(
            wrappedValue: CharacterImageViewModel(
                character: character
            )
        )
    }

    var body: some View {
        if !viewModel.loadingImage {
            viewModel.image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } else {
            ProgressView()
        }
    }
}

#Preview {
    CharacterImageView(character: Character.getMock())
}
