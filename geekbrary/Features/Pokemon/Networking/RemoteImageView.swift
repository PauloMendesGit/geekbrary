//
//  RemoteImageView.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 06/11/2023.
//

import SwiftUI

struct RemoteImageView: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo") // Placeholder for failed image loading
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    Image(systemName: "photo") // Placeholder for unknown state
                        .resizable()
                        .aspectRatio(contentMode: .fit)
            }
        }
    }
}
