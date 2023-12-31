//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharacterCardView: View {
    @StateObject private var viewModel: CharacterCardViewModel

    init(character: Character) {
        self._viewModel = StateObject(
            wrappedValue: CharacterCardViewModel(
                character: character
            )
        )
    }

    var body: some View {
        HStack(spacing: 15) {
            if !viewModel.loadingImage {
                viewModel.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.name)
                    .font(.headline)
                    .foregroundStyle(Color("AppWhiteColor"))

                HStack(spacing: 5) {
                    Circle()
                        .fill(viewModel.status.color)
                        .frame(width: 10, height: 10)
                    Text("\(viewModel.status.localizedTitle) - \(viewModel.species)")
                        .font(.subheadline)
                        .foregroundStyle(Color("AppWhiteColor"))
                }
            }

            Spacer()

            Rectangle()
                .fill(viewModel.status.color)
                .frame(width: 10, height: 100)
        }
        .background(
            Color("CharacterCardBackgroundColor")
                .opacity(0.5)
        )
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

#Preview {
    CharacterCardView(character: Character.getMock())
        .padding()
}
