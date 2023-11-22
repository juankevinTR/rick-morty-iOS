//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel: CharacterDetailViewModel

    let horizontalPadding: CGFloat = 15

    init(character: Character) {
        self._viewModel = StateObject(
            wrappedValue: CharacterDetailViewModel(
                character: character
            )
        )
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                if !viewModel.loadingImage {
                    viewModel.image
                        .resizable()
                } else {
                    ProgressView()
                }
            }
            .cornerRadius(10)

            HStack {
                Text("character_detail_title_info")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }

            GroupBox {
                ScrollView {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Label(
                                "character_detail_description_status \(viewModel.status.localizedTitle)",
                                systemImage: "eyes"
                            )
                            .imageScale(.large)

                            Label(
                                "character_detail_description_species \(viewModel.species)",
                                systemImage: "person.text.rectangle"
                            )
                            .imageScale(.large)

                            Label(
                                "character_detail_description_type \(viewModel.type)",
                                systemImage: "person.and.background.dotted"
                            )
                            .imageScale(.large)

                            Label(
                                "character_detail_description_gender \(viewModel.gender.localizedTitle)",
                                systemImage: "person.crop.square.filled.and.at.rectangle"
                            )
                            .imageScale(.large)

                            Label(
                                "character_detail_description_origin_location \(viewModel.originName)",
                                systemImage: "airplane.departure"
                            )
                            .imageScale(.large)

                            Label(
                                "character_detail_description_last_location \(viewModel.lastLocationName)",
                                systemImage: "airplane.arrival"
                            )
                            .imageScale(.large)
                        }

                        Spacer()
                    }
                }
            }
        }
        .navigationBarTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    CharacterDetailView(character: Character.getMock())
}
