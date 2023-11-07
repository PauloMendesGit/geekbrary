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
    var moves: [Moves]
    var sprites: Sprites
    var stats: [Stats]
    var types: [Types]
    var weight: Double
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

struct Moves: Decodable, Hashable {
    var move: Move
}

struct Move: Decodable, Hashable {
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
