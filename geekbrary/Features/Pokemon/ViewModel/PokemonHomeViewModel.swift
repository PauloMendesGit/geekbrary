//
//  PokemonHomeViewModel.swift
//  geekbrary
//
//  Created by Paulo Mendes on 30/04/2023.
//

import Foundation

class PokemonHomeViewModel: ObservableObject {
    @Published var pokedexes: [PokedexResults] = []
    @Published var pokemons: [PokemonsResults] = []
    @Published var rating: Int = 3
    var title = "Pokémons"
    
    var nextPokemons: String?
    var nextPokedexes: String?
    
//    init() {
//        loadPokedexData(with: FranchiseProperties.pokemon.baseUrl + "pokedex/", typeStruct: PokedexStruct.self)
//        loadPokemonData(with: FranchiseProperties.pokemon.baseUrl + "pokemon/", typeStruct: PokemonsStruct.self)
//    }
    

}
