//
//  FranchiseToView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 11/03/2023.
//

import Foundation

// This is the object we use to display data on the UI.
struct FranchiseToView: Identifiable {
    var id: Int = 0
    var franchise = Franchise(franchise: FranchiseResponse(name: ""))
}
    