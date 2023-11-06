//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 6/11/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    @StateObject private var viewModel: EpisodeDetailViewModel

    let horizontalPadding: CGFloat = 10

    init(episode: Episode) {
        let networkService: NetworkService = NetworkServiceImpl()

        let multipleCharactersRepository = MultipleCharactersRepositoryImpl(
            networkService: networkService
        )

        self._viewModel = StateObject(
            wrappedValue: EpisodeDetailViewModel(
                episode: episode,
                multipleCharactersRepository: multipleCharactersRepository
            )
        )
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Text("Information")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }

            GroupBox {
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            Label(
                                "episode_detail_title \(viewModel.name)",
                                systemImage: "film.fill"
                            )
                            Label(
                                "episode_detail_season \(viewModel.seasonNumber)",
                                systemImage: "list.bullet.rectangle.fill"
                            )
                            Label(
                                "episode_detail_episode \(viewModel.episodeNumber)", 
                                systemImage: "play.rectangle.fill"
                            )
                            Label(
                                "episode_detail_air_date \(viewModel.airDate)",
                                systemImage: "calendar.badge.plus"
                            )
                        }

                        Spacer()
                    }
                }
            }

            HStack {
                Text("view_tabbar_characters")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }

            GroupBox {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        if let characters = viewModel.characters {
                            ForEach(characters, id: \.self) { character in
                                NavigationLink(destination: CharacterDetailView(character: character)) {
                                    CharacterImageView(character: character)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                }
                            }
                        } else if viewModel.loadingCharacters {
                            ProgressView()
                        } else {
                            Text("view_no_characters_found")
                        }
                    }
                }
                .frame(height: 100)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding([.leading, .trailing], horizontalPadding)
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

#Preview {
    EpisodeDetailView(episode: Episode.getMockOriginalData())
}
