//
//  Pokemon.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    
    var name: String
    var imageURL: String?
    
    var id: String { name }
//
//    let name: String
//    let sprites: Sprites
    
//    var imageData: Data {
//        guard let url = URL(string: imageURL ?? "") else { return Data() }
//        guard let data = try? Data(contentsOf: url) else { return Data() }
//        return data
//    }
}
