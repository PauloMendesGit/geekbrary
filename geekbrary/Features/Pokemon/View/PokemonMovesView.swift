//
//  PokemonMovesView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 18/11/2023.
//

import SwiftUI

struct PokemonMovesView: View {
    var pokemonMoves: [PokemonMove]
    
    @StateObject var viewModel = PokemonMovesViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.movesDetails ?? [], id: \.self) { moveDetails in
                HStack {
                    Text(moveDetails.name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                }
            }
        }
        .tag(1)
        .onAppear {
            viewModel.loadMoveDetails(pokemonMoves: pokemonMoves) {
                DispatchQueue.main.async {
                }
            }
        }
    }
}
