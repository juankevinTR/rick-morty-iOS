//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct EpisodesView: View {
    @State private var didOnAppearFinish = false
    @StateObject private var episodesViewModel: EpisodesViewModel

    init() {
        let networkService: NetworkService = NetworkServiceImpl()

        let episodesWithPaginationRepository = EpisodesWithPaginationRepositoryImpl(networkService: networkService)
        self._episodesViewModel = StateObject(
            wrappedValue: EpisodesViewModel(
                episodesWithPaginationRepository: episodesWithPaginationRepository
            )
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                if let episodes = episodesViewModel.episodes {
                    List {
                        ForEach(episodes, id: \.self) { episode in
                            HStack {
                                Text("[\(episode.id)]")
                                Text("\(episode.name)")
                            }
                            .padding()
//                            NavigationLink(destination: EpisodeDetailView(episode: episode)) {
//                                HStack {
//                                    Text("[\(episode.id)]")
//                                    Text("\(episode.name)")
//                                }
//                                .padding()
//                            }
                        }

                        if episodesViewModel.nextPage != nil {
                            ProgressView()
                                .onAppear {
                                    episodesViewModel.fetchNextEpisodesSet()
                                }
                        }
                    }
                } else if episodesViewModel.loading {
                    ProgressView()
                } else {
                    Text("view_no_characters_found")
                }
            }
            .navigationBarTitle("view_tabbar_episodes")
            .onAppear {
                if !didOnAppearFinish {
                    episodesViewModel.fetchFirstEpisodesSet()
                    self.didOnAppearFinish = true
                }
            }
        }
    }
}

#Preview {
    EpisodesView()
}
