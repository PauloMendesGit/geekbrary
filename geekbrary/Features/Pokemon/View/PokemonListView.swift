//
//  PokemonDetailsView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 17/06/2023.
//

import SwiftUI

struct PokemonListView: View {
    @Environment(\.dismiss) var dismiss
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(.title)
        ScrollView {
            PokemonsList().padding()
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

struct PokemonsList: View {
    @StateObject var viewModel = PokemonListViewModel()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // Number of columns
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 50) {
            ForEach(viewModel.pokemonDetails, id: \.self) { pokemon in
                NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                    PokemonCellView(pokemon: pokemon)
                }
            }
        }
    }
}

struct PokemonCellView: View {
    let pokemon: PokemonDetails
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .bold()
                    .foregroundColor(.white)
                    .textCase(.uppercase)
                    .font(.largeTitle)
                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        Text(type.type.name)
                            .padding(8)
                            .background(Color.pokemonTypeColor(for: type.type.name))
                            .foregroundColor(.white)
                    }
                }
            }
            RemoteImageView(imageURL: pokemon.sprites.front_default ?? "")
                .frame(width: 200, height: 200)
                .shadow(color: .gray, radius: 20)
        }
        .cornerRadius(0)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(title: "Pokemon")
    }
}
