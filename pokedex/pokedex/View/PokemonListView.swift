//
//  PokemonListView.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import SwiftUI

struct PokemonListView: View {
  @ObservedObject var viewModel: PokemonListViewModel

  var body: some View {
      Text("hello")
    VStack {
      if viewModel.selectedPokemon != nil {
        PokemonView(pokemon: viewModel.selectedPokemon!)
          .padding()
          .transition(.scale)
      }

      ScrollView {
        LazyVGrid(columns: [GridItem(.flexible())]) {
          ForEach(viewModel.pokemons) { pokemon in
            Button(action: {
              self.viewModel.selectPokemon(pokemon)
            }) {
              PokemonView(pokemon: pokemon)
            }
          }
        }
      }
    }
  }
}
