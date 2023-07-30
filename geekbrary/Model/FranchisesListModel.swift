//
//  FranchisesListModel.swift
//  geekbrary
//
//  Created by Paulo Mendes on 18/03/2023.
//

import Foundation

struct PokedexDetails: Decodable {
    var name: String
}

// MARK: - Pokemon Structs
struct PokemonsStruct: Decodable {
    var next: String?
    var results: [PokemonsResults]
}

struct PokemonsResults: Decodable, Hashable {
    var name: String
    var url: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
    
    static func == (lhs: PokemonsResults, rhs: PokemonsResults) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}

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

// MARK: - Pokedex Structs
struct PokedexStruct: Decodable {
    var next: String?
    var results: [PokedexResults]
}

struct PokedexResults: Decodable, Hashable {
    var name: String
    var url: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
    
    static func == (lhs: PokedexResults, rhs: PokedexResults) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}


struct DragonballStruct: Decodable {
    // Define the struct properties and methods specific to the Dragon Ball franchise
}
