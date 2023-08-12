//
//  PokemonListCustomElementView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 12/08/2023.
//

import Foundation
import SwiftUI

struct PokemonListCustomElementView: View {
    
    var body: some View {
        ZStack {
            Color.green
            GeometryReader { geometry in
                VStack {
                    VStack {
                        Spacer()
                        Text("Bulbasaur")
                            .font(.custom("Helvetica", size: 60))
                        Spacer()
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: 200, height: 80)
                            .cornerRadius(80)
                            .overlay(
                                Text("Grass")
                                    .foregroundColor(.white)
                                    .font(.custom("Helvetica", size: 40))
                                
                            )
                        Rectangle()
                            .foregroundColor(.purple)
                            .frame(width: 200, height: 80)
                            .cornerRadius(40)
                            .overlay(
                                Text("Poison")
                                    .foregroundColor(.white)
                                    .font(.custom("Helvetica", size: 40))
                            )
                        Spacer()
                    }
                }
                .frame(width: geometry.size.width / 2, height: geometry.size.height)
                .background()
            }
        }
        .cornerRadius(40)
    }
}

struct PokemonListCustomElementView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCustomElementView()
    }
}
