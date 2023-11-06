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
        self._viewModel = StateObject(
            wrappedValue: EpisodeDetailViewModel(
                episode: episode
            )
        )
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name)
        }
        .navigationBarTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding([.leading, .trailing], horizontalPadding)
    }
}

#Preview {
    EpisodeDetailView(episode: Episode.getMock())
}
