//
//  FranchisesListHelper.swift
//  geekbrary
//
//  Created by Paulo Mendes on 02/07/2022.
//

import SwiftUI
import Combine

class FranchiseListViewModel: ObservableObject {
    @Published var franchises = [FranchiseModel]()
    
    func fetch() {
        franchises =
        [FranchiseModel(name: "Pokémon", detailView: AnyView(PokemonHomeView())),
         FranchiseModel(name: "Dragon Ball", detailView: AnyView(DragonBallHomeView())),
         FranchiseModel(name: "Blue Lock", detailView: AnyView(PokemonHomeView())),
         FranchiseModel(name: "One Piece", detailView: AnyView(PokemonHomeView()))]
    }
}
