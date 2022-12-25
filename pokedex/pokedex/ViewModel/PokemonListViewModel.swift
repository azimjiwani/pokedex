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
        self.pokemons = pokeAPI.fetchPokemon()
    }
    
    func selectPokemon(_ pokemon: Pokemon) {
        selectedPokemon = pokemon
    }
}
