//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharactersView: View {
    @State private var didOnAppearFinish = false
    @StateObject private var charactersViewModel: CharactersViewModel

    init() {
        let networkService: NetworkService = NetworkServiceImpl()

        let charactersWithPaginationRepository = CharactersWithPaginationRepositoryImpl(networkService: networkService)
        self._charactersViewModel = StateObject(
            wrappedValue: CharactersViewModel(
                charactersWithPaginationRepository: charactersWithPaginationRepository
            )
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                if let characters = charactersViewModel.characters {
                    List {
                        ForEach(characters, id: \.self) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                HStack {
                                    CircleTextView(
                                        color: character.status?.color ?? Color("CharacterStatusUnknownColor"),
                                        text: "\(character.id)"
                                    )
                                        .frame(maxWidth: 45, maxHeight: 45)
                                    Text("\(character.name)")
                                }
                                .padding()
                            }
                        }

                        if charactersViewModel.nextPage != nil {
                            ProgressView()
                                .onAppear {
                                    charactersViewModel.fetchNextCharactersSet()
                                }
                        }
                    }
                } else if charactersViewModel.loading {
                    ProgressView()
                } else {
                    Text("view_no_characters_found")
                }
            }
            .navigationBarTitle("view_tabbar_characters")
            .onAppear {
                if !didOnAppearFinish {
                    charactersViewModel.fetchFirstCharactersSet()
                    self.didOnAppearFinish = true
                }
            }
        }
    }
}

#Preview {
    CharactersView()
}
