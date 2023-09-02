//
//  APIRequest.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 29/08/2023.
//

import Foundation

enum PokemonURLs: String {
    case pokemonBaseURL = "https://pokeapi.co/api/v2"
    case pokemonListURL = "https://pokeapi.co/api/v2/pokemon"
}

class PokemonAPI {
    
    func loadPokemonData<T: Decodable>(with url: String, typeStruct: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        print("LOADING MORE POKEMONS")
        APIClient().performRequest(for: T.self, with: url) { [weak self] result in
            switch result {
                case .success(let data):
                    if let pokemonData = data as? T {
                        DispatchQueue.main.async {
                            completion(.success(pokemonData))
                        }
                    }
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
            }
        }
    }
    
    
//    func loadPokedexData<T: Decodable>(with url: String, typeStruct: T.Type) {
//        print("LOADING MORE POKEDEX")
//        APIClient().performRequest(for: typeStruct, with: url) { [weak self] result in
//            switch result {
//                case .success(let data):
//                    if let pokedexData = data as? PokedexStruct {
//                        DispatchQueue.main.async {
//                            self?.pokedexes = pokedexData.results
//                        }
//                    }
//                case .failure(let error):
//                    print(error)
//            }
//        }
//    }
//    
//    func loadPokemonDetails() {
//        APIClient().performRequest(for: PokemonDetails.self, with: "https://pokeapi.co/api/v2/pokemon/1") { [weak self] result in
//            switch result {
//                case .success(let data):
//                    if let pokemonData = data as? PokemonDetails {
//                        print(pokemonData)
//                    }
//                case .failure(let error):
//                    print(error)
//            }
//        }
//    }
}
