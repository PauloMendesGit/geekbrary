//
//  SerachBar.swift
//  geekbrary
//
//  Created by Paulo Mendes on 06/05/2023.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UIView {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        return searchBar
    }

    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SearchBar>) {
        if let searchBar = uiView.subviews.first as? UISearchBar {
            searchBar.text = text
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
}
