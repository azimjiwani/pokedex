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
    @Published var isLoading: Bool = false
    @Published var hasMorePokemon: Bool = true
    
    private let pokeAPI: PokeAPI
    var offset: Int = 0
    var limit: Int = 20
    
    init(pokeAPI: PokeAPI) {
        self.pokeAPI = pokeAPI
    }
    
    func fetchPokemon() {
        isLoading = true
        pokeAPI.fetchPokemon(limit: limit, offset: offset) { [weak self] pokemonArray in
            DispatchQueue.main.async {
                self?.pokemons += pokemonArray
                self?.offset += self?.limit ?? 0
                self?.hasMorePokemon = pokemonArray.count == self?.limit
                self?.isLoading = false
            }
        }
    }
    
    func loadMorePokemon() {
        guard !isLoading && hasMorePokemon else { return }
        fetchPokemon()
      }
    
    func selectPokemon(_ pokemon: Pokemon) {
        selectedPokemon = pokemon
    }
}
