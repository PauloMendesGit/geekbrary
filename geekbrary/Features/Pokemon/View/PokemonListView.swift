//
//  PokemonDetailsView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 17/06/2023.
//

import SwiftUI

struct PokemonListView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = PokemonListViewModel()
    
    var title: String
    
    var body: some View {
        List((viewModel.pokemonList?.results ?? []), id: \.self) { pokemon in
            Text(pokemon.name)
                .bold()
                .foregroundColor(.black)
                .textCase(.uppercase)
                .font(.largeTitle)
        }
    }
    
    private var backButton: some View {
        Button(action: {
            self.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}
