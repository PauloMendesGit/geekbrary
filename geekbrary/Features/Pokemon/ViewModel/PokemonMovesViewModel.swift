//
//  PokemonMovesViewModel.swift
//  Geekbrary
//
//  Created by Paulo Mendes on 18/11/2023.
//

import Foundation

class PokemonMovesViewModel: ObservableObject {
    @Published var movesDetails: [MoveDetails]?
    
    func loadMoveDetails(pokemonMoves: [PokemonMove], completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        movesDetails = []
        
        for pokemonMove in pokemonMoves {
            if pokemonMove.versionGroupDetails[0].levelLearnedAt > 0 {
                dispatchGroup.enter()
                
                PokemonAPI().loadPokemonData(with: pokemonMove.move.url, typeStruct: MoveDetails.self) { [weak self] result in
                    switch result {
                        case .success(let data):
                            self?.movesDetails?.append(data)
                        case .failure(let error):
                            print(error)
                    }
                }
                dispatchGroup.leave()
                //   }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
}



