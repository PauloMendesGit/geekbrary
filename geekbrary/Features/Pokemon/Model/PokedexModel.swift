//
//  PokedexModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 26/08/2023.
//

import Foundation

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
