//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharacterCardView: View {
    let viewModel: CharacterCardVM

    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: viewModel.imageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100) // You can adjust the size as needed
                } else if phase.error != nil {
                    // Handle the error, e.g., display a placeholder image or error message
                } else {
                    Image(systemName: "camera.metering.unknown")
                        .resizable()
                        .frame(width: 100, height: 100) // You can adjust the size as needed
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.name)
                    .font(.headline)

                HStack(spacing: 5) {
                    Circle()
                        .fill(.blue)
                        .frame(width: 10, height: 10)
                    Text("\(viewModel.status?.rawValue ?? "None") - \(viewModel.species)")
                        .font(.subheadline)
                }
            }

            Spacer() // This pushes the text column to the top
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

#Preview {
    CharacterCardView(
        viewModel:
            CharacterCardVM(
                name: "Mock name",
                status: nil,
                species: "Mock species",
                imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/516.jpeg")
            )
    )
}
