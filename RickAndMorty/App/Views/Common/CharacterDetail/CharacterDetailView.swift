//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel: CharacterDetailViewModel

    let horizontalPadding: CGFloat = 10

    init(character: Character) {
        self._viewModel = StateObject(
            wrappedValue: CharacterDetailViewModel(
                character: character
            )
        )
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                // Calculate the maximum width for the image
                let maxWidth = min(geometry.size.width - 2 * horizontalPadding, geometry.size.height)

                if !viewModel.loadingImage {
                    viewModel.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: maxWidth, height: maxWidth)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                        .frame(width: maxWidth, height: maxWidth)
                        .cornerRadius(10)
                }

                Text("character_detail_description_status \(viewModel.status.localizedTitle)")
                Text("character_detail_description_species \(viewModel.species)")
                Text("character_detail_description_type \(viewModel.type)")
                Text("character_detail_description_gender \(viewModel.gender.localizedTitle)")
                Text("character_detail_description_origin_location \(viewModel.originName)")
                Text("character_detail_description_last_location \(viewModel.lastLocationName)")
            }
            .navigationBarTitle(viewModel.name)
            .navigationBarTitleDisplayMode(.inline)
            .padding([.leading, .trailing], horizontalPadding)
        }

        Spacer()
    }
}

#Preview {
    CharacterDetailView(character: Character.getMock())
}
