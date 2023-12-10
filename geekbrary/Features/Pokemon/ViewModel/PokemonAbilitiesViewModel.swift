//
//  PokemonAbilitiesViewModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 10/12/2023.
//

import Foundation

class PokemonAbilitiesViewModel: ObservableObject {
    @Published var abilitiesDetails: [Abilities]?
    
    func loadAbilitiesDetails(pokemonAbilities: [Abilities], completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        abilitiesDetails = []
        
        for ability in pokemonAbilities {
            abilitiesDetails?.append(ability)
        }
    }
}
