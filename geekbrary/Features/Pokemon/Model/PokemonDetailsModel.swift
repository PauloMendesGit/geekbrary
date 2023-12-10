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
    var ability: Ability
    var is_hidden: Bool
}

struct Ability: Decodable, Hashable {
    var name: String
    var url: String
}

struct AbilityDetails: Decodable, Hashable, Equatable {
    let effectChanges: [AbilityEffectChanges]
    let effectEntries: [AbilityEffectEntry]
    var pokemon: AbilityPokemonList
    
    enum CodingKeys: String, CodingKey {
        case effectChanges = "effect_changes"
        case effectEntries = "effect_entries"
        case pokemon
    }
    
    static func == (lhs: AbilityDetails, rhs: AbilityDetails) -> Bool {
        return lhs.effectChanges == rhs.effectChanges && lhs.effectEntries == rhs.effectEntries && lhs.pokemon == rhs.pokemon
    }
}

struct AbilityEffectChanges: Decodable, Hashable, Equatable {
    var effectEntries: [AbilityEffectChangesEntry]
}

struct AbilityEffectChangesEntry: Decodable, Hashable, Equatable {
    var effect: String
    var language: AbilityLanguage
}

struct AbilityLanguage: Decodable, Hashable, Equatable {
    var name: String
}

struct AbilityEffectEntry: Decodable, Hashable {
    var effectEntries: EffectEntry
    
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
    }
//
//    static func == (lhs: AbilityEffectEntry, rhs: AbilityEffectEntry) -> Bool {
//        return lhs.effectEntries == rhs.effectEntries
//    }
}

struct EffectEntry: Decodable, Hashable {
    var effect: String
    var language: AbilityLanguage
}

struct AbilityPokemonList: Decodable, Hashable {
    var pokemon: PokemonName
}

struct PokemonName: Decodable, Hashable {
    var name: String
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
