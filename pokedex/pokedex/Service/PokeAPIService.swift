//
//  PokeAPIService.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation

class PokeAPI {
    func fetchPokemon() -> [Pokemon] {
        var pokemonArray = [Pokemon]()
        let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=0")!
        let data = try? Data(contentsOf: apiURL)
        
        if let data = data {
            let decoder = JSONDecoder()
            let pokemonListResponse = try? decoder.decode(PokemonList.self, from: data)
            
            for pokemonResult in pokemonListResponse?.results ?? [] {
                let pokemonURL = URL(string: pokemonResult.url)!
                let pokemonData = try? Data(contentsOf: pokemonURL)
                if let pokemonData = pokemonData {
                    let pokemon = try? decoder.decode(PokemonData.self, from: pokemonData)
                    let name = pokemonResult.name
                    let frontDefaultImageURL = pokemon?.sprites.front_default
                    pokemonArray.append(Pokemon(name: name, imageURL: frontDefaultImageURL))
                }
            }
            
        }
        return pokemonArray
    }
}
