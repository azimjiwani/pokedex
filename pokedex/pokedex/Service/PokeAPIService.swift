//
//  PokeAPIService.swift
//  pokedex
//
//  Created by Azim Jiwani on 2022-12-24.
//

import Foundation

enum PokeAPIResult {
  case success([Pokemon])
  case failure(Error)
}

class PokeAPI {
  func fetchPokemon(completion: @escaping (PokeAPIResult) -> Void) {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else {
        completion(.failure(NSError(domain: "PokeAPI", code: 0, userInfo: nil)))
        return
      }

      do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(PokemonResult.self, from: data)
        let pokemons = result.results
        completion(.success(pokemons))
      } catch {
        completion(.failure(error))
      }
    }

    task.resume()
  }
}
