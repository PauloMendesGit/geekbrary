//
//  PokemonDetailsView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 07/11/2023.
//

import SwiftUI

struct PokemonDetailsView: View {
    var pokemon: PokemonDetails
    @State private var selectedTab = 0
    
    var body: some View {
                GeometryReader3D { geometry in
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Spacer()
                                Text(pokemon.name)
                                    .textCase(.uppercase)
                                    .fontWeight(.bold)
                                    .font(.title)
                                Text("#\(pokemon.id)")
                                    .fontWeight(.bold)
                                    .font(.title)
                                Spacer()
                            }
                            HStack {
                                ForEach(pokemon.types, id: \.self) { type in
                                    Text(type.type.name)
                                        .padding(16)
                                        .background(Color.pokemonTypeColor(for: type.type.name))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .cornerRadius(16)
                                }
                            }
                        }
                        RemoteImageView(imageURL: pokemon.sprites.front_default ?? "")
                            .frame(minWidth: geometry.size.height * 0.4, maxWidth: geometry.size.height * 0.5, minHeight: geometry.size.height * 0.4, maxHeight: geometry.size.height * 0.5)
                            .shadow(color: .gray, radius: 20)
                        Spacer()
                        
                }.frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                        .padding(geometry.size.height * 0.04)

                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        TabButton(title: "Stats", index: 0, selectedIndex: $selectedTab)
                        Spacer()
                        TabButton(title: "Moves", index: 1, selectedIndex: $selectedTab)
                        Spacer()
                        TabButton(title: "Abilities", index: 2, selectedIndex: $selectedTab)
                        Spacer()
                        TabButton(title: "Types", index: 3, selectedIndex: $selectedTab)
                        Spacer()
                    }
                    
                    TabView(selection: $selectedTab) {
                        PokemonStatsView(pokemonStats: pokemon.stats)
                        PokemonMovesView(pokemonMoves: pokemon.moves)
                        PokemonAbilitiesView()
                        PokemonTypesView()
                    }
                }
                .padding(EdgeInsets(top: geometry.size.height * 0.35, leading: 0, bottom: 0, trailing: 0))
            }
        }
}

struct TabButton: View {
    var title: String
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            self.selectedIndex = self.index
        }) {
            Text(title)
                .foregroundColor(.black)
        }.frame(width: 200)
    }
}
