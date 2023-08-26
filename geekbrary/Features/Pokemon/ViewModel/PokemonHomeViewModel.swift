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
    var title = "Pokémon"
    
    var nextPokemons: String?
    var nextPokedexes: String?
    
//    init() {
//        loadPokedexData(with: FranchiseProperties.pokemon.baseUrl + "pokedex/", typeStruct: PokedexStruct.self)
//        loadPokemonData(with: FranchiseProperties.pokemon.baseUrl + "pokemon/", typeStruct: PokemonsStruct.self)
//    }
    
    //MARK: - Pokemon Methods
    
    func loadPokemonData<T: Decodable>(with url: String, typeStruct: T.Type) {
        print("LOADING MORE POKEMONS")
        APIClient().performRequest(for: typeStruct, with: url) { [weak self] result in
            switch result {
                case .success(let data):
                    if let pokemonData = data as? PokemonsStruct {
                        if let next = pokemonData.next {
                            self?.nextPokemons = next
                        }
                        DispatchQueue.main.async {
                            self?.pokemons.append(contentsOf: pokemonData.results)
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func loadPokemonDetails() {
        APIClient().performRequest(for: PokemonDetails.self, with: "https://pokeapi.co/api/v2/pokemon/1") { [weak self] result in
            switch result {
                case .success(let data):
                    if let pokemonData = data as? PokemonDetails {
                        print(pokemonData)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    //MARK: - Pokedex Methods
    
    func loadPokedexData<T: Decodable>(with url: String, typeStruct: T.Type) {
        print("LOADING MORE POKEDEX")
        APIClient().performRequest(for: typeStruct, with: url) { [weak self] result in
            switch result {
                case .success(let data):
                    if let pokedexData = data as? PokedexStruct {
                        DispatchQueue.main.async {
                            self?.pokedexes = pokedexData.results
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
