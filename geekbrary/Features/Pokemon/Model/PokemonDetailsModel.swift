//
//  PokemonDetailsModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 26/08/2023.
//

import Foundation

struct PokemonDetails: Decodable {
    var abilities: [Abilities]
    var height: Double
    var id: Int
    var moves: [Moves]
    var sprites: [Sprites]
    var stats: [Stats]
    var types: [Types]
    var weight: Double
}

struct Abilities: Decodable {
    var name: String
    var url: String
}

struct Moves: Decodable {
    var move: Move
}

struct Move: Decodable {
    var name: String
    var url: String
}

struct Sprites: Decodable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
}

struct Stats: Decodable {
    var base_stat: Int
    var stat: Stat
}

struct Stat: Decodable {
    var name: String
    var url: String
}

struct Types: Decodable {
    var type: TypeData
}

struct TypeData: Decodable {
    var name: String
    var url: String
}
