//
//  PokemonDetailsView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 17/06/2023.
//

import SwiftUI

struct PokemonDetailsView: View {
    var title: String
    
    var viewModel = PokemonHomeViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var isActive: Bool

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    // Add your action for the first button here
                }) {
                    Text("Button 1")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Add your action for the second button here
                }) {
                    Text("Button 2")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .cornerRadius(10)
                }
            }
            
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    // Add your action for the third button here
                }) {
                    Text("Button 3")
                    
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Add your action for the fourth button here
                }) {
                    Text("Button 4")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    private var backButton: some View {
        Button(action: {
            self.dismiss()
            isActive = false // Navigate back to SecondView
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}
