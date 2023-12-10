//
//  PokemonMovesModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 18/11/2023.
//

import Foundation

struct PokemonMove: Decodable, Hashable, Equatable {
    let move: MoveDetailsWrapper
    let versionGroupDetails: [VersionGroupDetails]
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    static func == (lhs: PokemonMove, rhs: PokemonMove) -> Bool {
        return lhs.move == rhs.move && lhs.versionGroupDetails == rhs.versionGroupDetails
    }
}

struct MoveDetailsWrapper: Decodable, Equatable, Hashable {
    let name: String
    let url: String
}

struct VersionGroupDetails: Decodable, Equatable, Hashable {
    let levelLearnedAt: Int
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
    }
}

struct MoveDetails: Decodable, Identifiable, Hashable {
    var id: Int
    var accuracy: Int?
    var effectChance: Int?
    var effectEntries: [EffectEntries]
    var name: String
    var power: Int?
    var pp: Int
    var type: Element
    
    enum CodingKeys: String, CodingKey {
        case id
        case accuracy
        case effectChance = "effect_chance"
        case effectEntries = "effect_entries"
        case name
        case power
        case pp
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        accuracy = try? container.decode(Int.self, forKey: .accuracy)
        effectChance = try? container.decode(Int.self, forKey: .effectChance)
        effectEntries = try container.decode([EffectEntries].self, forKey: .effectEntries)
        name = try container.decode(String.self, forKey: .name)
        power = try? container.decode(Int.self, forKey: .power)
        pp = try container.decode(Int.self, forKey: .pp)
        type = try container.decode(Element.self, forKey: .type)
    }
}

struct EffectEntries: Decodable, Hashable {
    var short_effect: String
}

struct Element: Decodable, Equatable, Hashable {
    var name: String
}
