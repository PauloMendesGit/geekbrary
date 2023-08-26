//
//  DragonBallHomeView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 22/08/2023.
//

import SwiftUI
import Combine


struct DragonBallHomeView: View {
    
    @StateObject var viewModel = DragonBallHomeViewModel()
    
    @State private var showPokemonDetailsView = false
    @State private var showPokedexDetailsView = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.title)
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
                CategoryButton(title: "Pokemons", destination: DragonBallDetailsView(title: "DragonBall"))
                CategoryButton(title: "Pokemons", destination: DragonBallDetailsView(title: "DragonBall"))
            }
            
            HStack(alignment: .center, spacing: 20) {
                CategoryButton(title: "Pokemons", destination: DragonBallDetailsView(title: "DragonBall"))
                CategoryButton(title: "Pokemons", destination: DragonBallDetailsView(title: "DragonBall"))
            }
            
            HStack(alignment: .center, spacing: 20) {
                CategoryButton(title: "Pokemons", destination: DragonBallDetailsView(title: "DragonBall"))
                CategoryButton(title: "Pokemons", destination: DragonBallDetailsView(title: "DragonBall"))
            }
            Spacer()
        }
    }
}

struct DragonBallHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DragonBallHomeView()
    }
}
