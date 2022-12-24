//
//  Pokemon.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    var id: String { name }
    
    let name: String
    let sprites: Sprites
    
    var imageData: Data {
        guard let url = URL(string: sprites.frontDefault) else { return Data() }
        guard let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
}
