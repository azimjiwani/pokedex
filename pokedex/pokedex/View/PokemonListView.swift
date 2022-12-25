//
//  PokemonListView.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel: PokemonListViewModel
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if viewModel.selectedPokemon != nil {
                PokemonDetailView(pokemon: viewModel.selectedPokemon!)
                    .padding()
                    .transition(.scale)
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
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
        .frame(maxWidth: .infinity)
    }
}
