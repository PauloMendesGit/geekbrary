//
//  ContentView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 02/07/2022.
//

import SwiftUI
import CoreData

struct FranshisesListContentView: View {
    let franchiseList: [Franchises] = [.Pokemon, .HarryPotter, .DragonBall]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(franchiseList, id: \.self) { franchise in
                    NavigationLink(destination: FranchiseDetailsContentView()) {
                        ZStack {
                            Image("PokemonCellBackground")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(0.3)
                            Text(franchise.rawValue)
                                .bold()
                                .foregroundColor(.black)
                                .textCase(.uppercase)
                        }
                    }
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct FranshisesListContentView_Previews: PreviewProvider {
    static var previews: some View {
        FranshisesListContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
