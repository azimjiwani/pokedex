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
                   GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Spacer()
            if viewModel.selectedPokemon != nil {
                PokemonDetailView(pokemon: viewModel.selectedPokemon!)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .transition(.scale)
            }
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pokemons, id: \.self) { pokemon in
                        Button(action: {
                            self.viewModel.selectPokemon(pokemon)
                        }) {
                            PokemonView(pokemon: pokemon)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .background(
                    GeometryReader { geometry in
                        Color.clear.preference(key: ScrollEndKey.self, value: [geometry.frame(in: .global).maxY])
                    }
                )
            }
        }
        .onPreferenceChange(ScrollEndKey.self) { value in
            let distanceFromBottom = value[0] - UIScreen.main.bounds.height
            if distanceFromBottom < 100 && !self.viewModel.isLoading && self.viewModel.hasMorePokemon {
                self.viewModel.fetchPokemon()
            }
        }
    }
}

struct ScrollEndKey: PreferenceKey {
    static var defaultValue: [CGFloat] = []
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
