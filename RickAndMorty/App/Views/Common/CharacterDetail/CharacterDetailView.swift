//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    let horizontalPadding: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                // Calculate the maximum width for the image
                let maxWidth = min(geometry.size.width - 2 * horizontalPadding, geometry.size.height)

                AsyncImage(url: URL(string: character.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: maxWidth, height: maxWidth)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        // Handle the error, e.g., display a placeholder image or error message
                    } else {
                        Image(systemName: "camera.metering.unknown")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: maxWidth, height: maxWidth)
                            .cornerRadius(10)
                    }
                }

                Text("Status: \(character.status?.rawValue ?? "Unknown")")
                Text("Species: \(character.species)")
                Text("Type: \(character.type)")
                Text("Gender: \(character.gender?.rawValue ?? "Unknown")")
                Text("Origin: \(character.origin.name)")
                Text("Last known location:: \(character.location.name)")
            }
            .navigationBarTitle(character.name)
            .navigationBarTitleDisplayMode(.inline)
            .padding([.leading, .trailing], horizontalPadding)
        }

        Spacer() // Push the content to the left
    }
}

#Preview {
    CharacterDetailView(character: Character.getMock())
}
