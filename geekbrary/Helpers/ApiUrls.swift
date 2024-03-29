//
//  ApiUrls.swift
//  geekbrary
//
//  Created by Paulo Mendes on 04/03/2023.
//

import Foundation
import SwiftUI

struct PokemonProperties {
    var name = "Pokémon"
    var image = "pokemon"
    var baseURL = "https://pokeapi.co/api/v2/"
}

struct DragonBallProperties {
    var name = "Dragon Ball"
    var image = "dragonball"
    var baseURL = "https://pokeapi.co/api/v2/"
}

//enum FranchiseProperties {
//    case pokemon
//    case dragonball
//    
//    var name: String {
//        switch self {
//        case .pokemon:
//            return "Pokémon"
//        case .dragonball:
//            return "Dragon Ball"
//        }
//    }
//    
//    var image: String {
//        switch self {
//        case .pokemon:
//            return "pokemon"
//        case .dragonball:
//            return "dragonball"
//        }
//    }
//    
//    var baseUrl: String {
//        switch self {
//        case .pokemon:
//            return "https://pokeapi.co/api/v2/"
//        case .dragonball:
//            return "https://pokeapi.co/api/v2/"
//        }
//    }
//    
//    var decodingBaseStruct: Decodable.Type {
//        switch self {
//        case .pokemon:
//            return PokedexStruct.self
//        case .dragonball:
//            return DragonballStruct.self
//        }
//    }
//    
//    func detailsPage() -> some View {
//        switch self {
//        case .pokemon:
//            return PokemonHomeView(franchise: self)
//        case .dragonball:
//            return DragonBallHomeView(franchise: self)
//        }
//    }
//}

class APIClient: ObservableObject {

//    func performRequest(for endpoint: FranchiseProperties, completion: @escaping (Result<Decodable, Error>) -> Void) {
//        let url = URL(string: endpoint.baseUrl)!
//        let request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "com.example.app", code: -1, userInfo: nil)))
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(endpoint.decodingBaseStruct, from: data)
//                completion(.success(decodedData))
//            } catch let error {
//                completion(.failure(error))
//            }
//        }
//
//        task.resume()
//    }
    
    func performRequest<T: Decodable>(for decodingType: T.Type, with url: String, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = URL(string: url) {
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "com.example.app", code: -1, userInfo: nil)))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(decodingType, from: data)
                    completion(.success(decodedData))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
}
