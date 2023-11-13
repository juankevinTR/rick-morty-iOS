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
            GeometryReader { geometry in
                ScrollView {
                    ZStack {
                        Rectangle()
                            .fill(
                                Color("TabViewItemBackgroundColor")
                                    .opacity(0.5)
                            )

                        if let characters = homeViewModel.characters {
                            ScrollView(.vertical) {
                                LazyVStack {
                                    ForEach(characters, id: \.self) { character in
                                        NavigationLink(destination: CharacterDetailView(character: character)) {
                                            CharacterCardView(character: character)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding()
                            }
                        } else if homeViewModel.loading {
                            ProgressView()
                        } else {
                            Text("view_no_characters_found")
                        }
                    }
                    .frame(minHeight: geometry.size.height)
                }
                .navigationBarTitle("view_tabbar_home")
                .onAppear {
                    if !didOnAppearFinish {
                        homeViewModel.fetchRandomCharacters()
                        self.didOnAppearFinish = true
                    }
                }
                .refreshable {
                    // Pull-to-refresh to get another random characters
                    homeViewModel.fetchRandomCharacters()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
