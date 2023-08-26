//
//  FranchiseModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 26/08/2023.
//

import SwiftUI

struct FranchiseModel: Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var detailView: AnyView
    
    init(name: String, detailView: AnyView) {
        self.name = name
        self.detailView = detailView
    }
    
    static func == (lhs: FranchiseModel, rhs: FranchiseModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

