//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct HomeView: View {
    @State private var didOnAppearFinish = false
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
                        LazyVStack {
                            ForEach(characters, id: \.self) { character in
                                NavigationLink(destination: CharacterDetailView(character: character)) {
                                    CharacterCardView(character: character)
                                        .padding([.leading, .trailing], 10)
                                }
                                .buttonStyle(.plain)
                            }
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
                if !didOnAppearFinish {
                    homeViewModel.fetchRandomCharacters()
                    self.didOnAppearFinish = true
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
