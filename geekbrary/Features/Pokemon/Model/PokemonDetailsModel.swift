//
//  PokemonDetailsModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 26/08/2023.
//

import Foundation

struct PokemonDetails: Decodable, Hashable {
    var id: Int
    var name: String
    var abilities: [Abilities]
    var height: Double
    var moves: [PokemonMove]
    var sprites: Sprites
    var stats: [Stats]
    var types: [Types]
    var weight: Double
}

extension PokemonDetails: Equatable {
    static func == (lhs: PokemonDetails, rhs: PokemonDetails) -> Bool {
        // Compare properties to determine equality
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.abilities == rhs.abilities &&
        lhs.height == rhs.height &&
        lhs.moves == rhs.moves &&
        lhs.sprites == rhs.sprites &&
        lhs.stats == rhs.stats &&
        lhs.types == rhs.types &&
        lhs.weight == rhs.weight
    }
}

struct Abilities: Decodable, Hashable {
    var ability: Ability  // Ability is a nested struct
    var is_hidden: Bool
    var slot: Int
}

struct Ability: Decodable, Hashable {
    var name: String
    var url: String
}

struct Sprites: Decodable, Hashable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
}

struct Stats: Decodable, Hashable {
    var base_stat: Int
    var stat: Stat
}

struct Stat: Decodable, Hashable {
    var name: String
    var url: String
}

struct Types: Decodable, Hashable {
    var type: TypeData
}

struct TypeData: Decodable, Hashable {
    var name: String
    var url: String
}
