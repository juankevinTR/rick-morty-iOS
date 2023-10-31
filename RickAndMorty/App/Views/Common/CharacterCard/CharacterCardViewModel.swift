//
//  CharacterCardViewModel.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import Foundation

// MARK: - App
struct CharacterCardVM: Codable {
    let name: String
    let status: CharacterStatus?
    let species: String
    let imageURL: URL?

    static func getWith(
        character: Character
    ) -> CharacterCardVM {
        return CharacterCardVM(
            name: character.name,
            status: character.status,
            species: character.species,
            imageURL: URL(string: character.image)
        )
    }
}
