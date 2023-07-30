//
//  ContentView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 10/07/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @StateObject var viewModel = FranchiseListViewModel()

    @State var showImmersiveSpace = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        NavigationSplitView {
            List(viewModel.apiEndpoints, id: \.self) { franchise in
                    NavigationLink(destination: franchise.detailsPage()){
                        Text(franchise.name)
                    }
            }
            .navigationTitle("Library")
        } detail: {
                VStack {
                    Model3D(named: "Scene", bundle: realityKitContentBundle)
                        .padding(.bottom, 50)
                    
                    Text("Hello, world!")
                    
                    Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                        .toggleStyle(.button)
                        .padding(.top, 50)
                }
                .navigationTitle("Content")
                
                .padding()
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
            Text("DETAIL")
    }
}

#Preview {
    ContentView()
}
