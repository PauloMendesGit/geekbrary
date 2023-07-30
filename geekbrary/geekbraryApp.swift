//
//  geekbraryApp.swift
//  geekbrary
//
//  Created by Paulo Mendes on 10/07/2023.
//

import SwiftUI

@main
struct geekbraryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
