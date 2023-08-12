//
//  PokemonHomeView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 02/07/2022.
//

import SwiftUI
import Combine

struct PokemonHomeView: View {
    
    @State var franchise: FranchiseProperties
    @StateObject var viewModel = PokemonHomeViewModel()
    
    @State private var showPokemonDetailsView = false
    @State private var showPokedexDetailsView = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 16) {
            Text(franchise.name)
                .font(.custom("", size: 40.0))
                .fontWeight(.bold)
                .textCase(.uppercase)
                .padding(.top, 0)
            
            HStack(spacing: 10) {
                ForEach(0..<5) { index in
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(index < viewModel.rating ? .yellow : .gray)
                        .onTapGesture {
                            viewModel.rating = index + 1
                        }
                }
            }
        }
        .padding(.top, 26)
        
        VStack(spacing: 30) {
            Spacer()
            HStack(alignment: .center, spacing: 20) {
                CategoryButton(title: "Pokemons", destination: PokemonDetailsView(title: "Pokemons", viewModel: viewModel))
                CategoryButton(title: "Pokedexes", destination: PokemonDetailsView(title: "Pokedexes", viewModel: viewModel))
            }
            
            HStack(alignment: .center, spacing: 20) {
                CategoryButton(title: "Abilities", destination: PokemonDetailsView(title: "Pokedexes", viewModel: viewModel))
                CategoryButton(title: "Moves", destination: PokemonDetailsView(title: "Pokedexes", viewModel: viewModel))
            }
            
            HStack(alignment: .center, spacing: 20) {
                CategoryButton(title: "Types",  destination: PokemonDetailsView(title: "Pokedexes", viewModel: viewModel))
                CategoryButton(title: "Berry", destination: PokemonDetailsView(title: "Pokedexes", viewModel: viewModel))
            }
            Spacer()
        }
    }
}

struct CategoryButton<Destination: View>: View {
    let title: String
    var destination: Destination
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                NavigationLink(destination: destination) {
                    Text(title)
                        .font(.title2)
                        .frame(width: geometry.size.width, height: geometry.size.width)
                }
            }
        }.frame(width: 300, height: 100)
    }
}

struct PokemonHomeView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyData = FranchiseProperties.pokemon
        PokemonHomeView(franchise: dummyData)
    }
}
