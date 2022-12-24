//
//  PokemonView.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import SwiftUI

struct PokemonView: View {
  let pokemon: Pokemon

  var body: some View {
    VStack {
      Text(pokemon.name)
        .font(.title)

      Image(uiImage: UIImage(data: pokemon.imageData)!)
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
  }
}
