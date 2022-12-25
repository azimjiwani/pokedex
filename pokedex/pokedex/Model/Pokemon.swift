//
//  Pokemon.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation

struct Pokemon: Decodable, Hashable {
    
    var name: String
    var imageURL: String?
}
