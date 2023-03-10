//
//  PokemonView.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import SwiftUI

private enum Constants {
    static let size: CGFloat = 120.0
}

struct PokemonView: View {
    let pokemon: Pokemon
    
    var body: some View {
        AsyncImage(
            url: URL(string: pokemon.imageURL ?? ""),
            content: {
                image in image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.size, height: Constants.size)
            },
            placeholder: {
                Image(systemName: "globe")
            }
        )
        
    }
}
