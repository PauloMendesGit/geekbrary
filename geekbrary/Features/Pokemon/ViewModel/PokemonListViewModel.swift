//
//  PokemonDetailsViewModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 29/08/2023.
//

import Combine

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: PokemonsStruct?
    @Published var pokemonDetails: [PokemonDetails] = []
    @Published var hasLoadedPokemonList = false
    
    init() {
        PokemonAPI().loadPokemonData(with: PokemonURLs.pokemonListURL.rawValue, typeStruct: PokemonsStruct.self) { [weak self] result in
            switch result {
                case .success(let data):
                    self?.pokemonList = data
                    
                    // To start loading details for the first Pokemon
                    self?.loadPokemonDetails(for: 0)
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func loadPokemonDetails(for index: Int) {
        guard let pokemonList = pokemonList else { return }
        
        guard index < pokemonList.results.count else {
            // All requests are complete
            return
        }
        
        let pokemon = pokemonList.results[index]
        PokemonAPI().loadPokemonData(with: pokemon.url, typeStruct: PokemonDetails.self) { [weak self] result in
            switch result {
                case .success(let data):
                    self?.pokemonDetails.append(data)
                    // Load details for the next Pokemon
                    self?.loadPokemonDetails(for: index + 1)
                case .failure(let error):
                    print(error)
                    // Load details for the next Pokemon even if this one fails
                    self?.loadPokemonDetails(for: index + 1)
            }
        }
    }
}
