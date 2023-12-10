//
//  PokemonAbilitiesView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 18/11/2023.
//

import SwiftUI

struct PokemonAbilitiesView: View {
    var pokemonAbilities: [Abilities]
    @StateObject var viewModel = PokemonAbilitiesViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.abilitiesDetails ?? [], id: \.self) { abilityDetails in
                HStack {
                    Text(abilityDetails.ability.name)
                }
            }
        }.tag(2)
            .onAppear {
                viewModel.loadAbilitiesDetails(pokemonAbilities: pokemonAbilities) {
                    
                }
            }
    }
}
