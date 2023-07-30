//
//  FranchisesListHelper.swift
//  geekbrary
//
//  Created by Paulo Mendes on 02/07/2022.
//

import Foundation
import Combine

class FranchiseListViewModel: ObservableObject {
    
    @Published var id = UUID().uuidString
    let apiEndpoints: [FranchiseProperties] = [.pokemon, .dragonball]
}
