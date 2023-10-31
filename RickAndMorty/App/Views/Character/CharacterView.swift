//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharacterView: View {
    @StateObject private var characterViewModel: CharacterViewModel

    init() {
        let characterRepository = CharacterRepositoryImpl(networkService: NetworkServiceImpl())
        self._characterViewModel = StateObject(
            wrappedValue: CharacterViewModel(characterRepository: characterRepository)
        )
    }

    var body: some View {
        VStack {
            if let character = characterViewModel.character {
                ScrollView(.vertical) {
                    ForEach(0..<6) { _ in
                        CharacterCardView(viewModel: CharacterCardVM.getWith(character: character))
                    }
                }
            } else if characterViewModel.loading {
                ProgressView()
            } else {
                Text("Any character was found.")
            }
        }
        .onAppear {
            characterViewModel.fetchCharacter()
        }
    }
}

#Preview {
    CharacterView()
}
