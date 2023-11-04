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

                Text("Status: \(viewModel.status.getLocalized())")
                Text("Species: \(viewModel.species)")
                Text("Type: \(viewModel.type)")
                Text("Gender: \(viewModel.gender.getLocalized())")
                Text("Origin: \(viewModel.originName)")
                Text("Last known location: \(viewModel.lastLocationName)")
            }
            .navigationBarTitle(viewModel.name)
            .navigationBarTitleDisplayMode(.inline)
            .padding([.leading, .trailing], horizontalPadding)
        }

        Spacer() // Push the content to the left
    }
}

#Preview {
    CharacterDetailView(character: Character.getMock())
}
