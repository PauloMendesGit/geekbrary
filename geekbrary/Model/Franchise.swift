//
//  Franchise.swift
//  geekbrary
//
//  Created by Paulo Mendes on 11/03/2023.
//

import Foundation

struct Franchise: Identifiable {
    var id = UUID().uuidString
    var name: String
    
    init(franchise: FranchiseResponse) {
        name = franchise.name
    }

}
