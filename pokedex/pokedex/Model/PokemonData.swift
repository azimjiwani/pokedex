//
//  PokemonData.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation
struct PokemonData: Decodable {
    let sprites: Sprites

    struct Sprites: Decodable {
        let front_default: String
    }
}
