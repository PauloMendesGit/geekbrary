//
//  DragonBallDetailsView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 22/08/2023.
//

import SwiftUI
import Combine

struct DragonBallDetailsView: View {
    var title: String
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text(title)
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
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}
