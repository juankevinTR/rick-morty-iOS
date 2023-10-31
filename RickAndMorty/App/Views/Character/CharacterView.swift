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
        let networkService: NetworkService = NetworkServiceImpl()
        
        let characterRepository = CharacterRepositoryImpl(networkService: networkService)
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
                Text("view_no_characters_found")
            }
        }
        .onAppear {
            characterViewModel.fetchCharacter(characterId: 1)
        }
    }
}

#Preview {
    CharacterView()
}
