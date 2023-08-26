//
//  ContentView.swift
//  geekbrary
//
//  Created by Paulo Mendes on 02/07/2022.
//

import SwiftUI

struct FranshisesListView: View {
    @StateObject var viewModel = FranchiseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.franchises, id: \.self) { franchise in
                NavigationLink(destination: franchise.detailView)
                {}
                Text(franchise.name)
                    .bold()
                    .foregroundColor(.black)
                    .textCase(.uppercase)
                    .font(.largeTitle)
            }.aspectRatio(contentMode: .fill)
        }.navigationBarItems(leading:
                                Button(action: {
            // Custom back button action
        }) {
            Image(systemName: "arrow.backward")
            Text("Back")
        }
        )
    }
}

struct FranshisesListContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FranchiseListViewModel()
        
        FranshisesListView(viewModel: viewModel).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
