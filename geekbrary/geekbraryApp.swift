//
//  geekbraryApp.swift
//  geekbrary
//
//  Created by Paulo Mendes on 02/07/2022.
//

import SwiftUI

@main
struct geekbraryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FranshisesListContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
