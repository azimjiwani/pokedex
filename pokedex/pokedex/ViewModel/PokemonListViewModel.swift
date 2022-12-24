//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var selectedPokemon: Pokemon?
    
    private let pokeAPI: PokeAPI
    
    init(pokeAPI: PokeAPI) {
        self.pokeAPI = pokeAPI
    }
    
    func fetchPokemon() {
        pokeAPI.fetchPokemon { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectPokemon(_ pokemon: Pokemon) {
        selectedPokemon = pokemon
    }
}
