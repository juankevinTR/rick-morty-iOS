//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel: HomeViewModel

    init() {
        let networkService: NetworkService = NetworkServiceImpl()

        let multipleCharactersRepository = MultipleCharactersRepositoryImpl(networkService: networkService)
        self._homeViewModel = StateObject(
            wrappedValue: HomeViewModel(
                multipleCharactersRepository: multipleCharactersRepository
            )
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                if let characters = homeViewModel.characters {
                    ScrollView(.vertical) {
                        ForEach(characters, id: \.self) { character in
                            CharacterCardView(
                                viewModel: CharacterCardVM.getWith(character: character)
                            )
                        }
                    }
                } else if homeViewModel.loading {
                    ProgressView()
                } else {
                    Text("view_no_characters_found")
                }
            }
            .navigationBarTitle("view_tabbar_home")
            .onAppear {
                homeViewModel.fetchRandomCharacters()
            }
        }
    }
}

#Preview {
    HomeView()
}
