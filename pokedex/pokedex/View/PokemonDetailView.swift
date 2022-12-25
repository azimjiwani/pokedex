//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import SwiftUI

private enum Constants {
    static let verticalPadding: CGFloat = 24.0
    static let size: CGFloat = 300.0
}

struct PokemonDetailView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: pokemon.imageURL ?? ""),
                content: {
                    image in image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: Constants.size, maxHeight: Constants.size)
                },
                placeholder: {
                    Image(systemName: "globe")
                }
            )
            .padding(.vertical, Constants.verticalPadding)
            Text(pokemon.name)
                .font(.headline)
                .foregroundColor(Color.white)
            Spacer()
        }
        .background(Color.black)
        .frame(maxWidth: .infinity)
    }
}
