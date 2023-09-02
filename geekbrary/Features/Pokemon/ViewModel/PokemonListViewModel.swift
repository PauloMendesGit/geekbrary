//
//  PokemonDetailsViewModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 29/08/2023.
//

import Combine

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: PokemonsStruct?
    
    init() {
        PokemonAPI().loadPokemonData(with: PokemonURLs.pokemonListURL.rawValue, typeStruct: PokemonsStruct.self) { [weak self] result in
            switch result {
                case .success(let data):
                    self?.pokemonList = data
                case .failure(let error):
                    print(error)
            }
        }
    }
}
