//
//  ContentView.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let pokeAPI = PokeAPI()
        let viewModel = PokemonListViewModel(pokeAPI: pokeAPI)
        viewModel.fetchPokemon()
        
        return PokemonListView(viewModel: viewModel)
            .frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
