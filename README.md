# Pokedex for iOS


An iOS app that fetches the list of Pokemon from the PokeAPI and shows them in a grid. When a Pokemon is tapped on, it is shown in the top center of the screen with its name on a black background. The app also supports pagination so it doesn't load all the Pokemon at once. Instead, when the user scrolls near the bottom of the screen, more Pokemon are loaded.

## Demo:
https://user-images.githubusercontent.com/31975469/209485075-c712929a-f3c0-4e39-8ddf-6a1f29f16847.mp4

## Architecture: Model View View-Model with Service in SwiftUI
### Service Layer:
The service layer fetches data from the PokeAPI and populates the models with the required data. Two API calls are made.
The first API call is made to get the list of Pokemon from the PokeAPI with the number of results and offset to support pagination. The data is received in the format of `{"name", "url"}`
The second API call uses the "url" returned and gets the `front_default` property from the `sprites` property.
Finally, the responses are decoded using the Models created and the data is passed to the ViewModel with a completion handler

### Model Layer:
The Model layer consists of a few different models.
1. `PokemonListResult` this model is used to decode the first API response from the PokeAPI
2. `PokemonList` contains an array of `PokemonListResult`
3. `PokemonData` contains the `sprites` and `front_default` properties to be used to decode the response from the second API call
4. `Pokemon` this model is used to create the view. It contains the `name` and `imageURL` properties. This is used to create the views.

### View Layer:
The view layer consists of three views:
1. **`PokemonView`**
  This view creates the Pokemons shown in the grid while scrolling. It is achieved using `AsyncImage` which displays a globe placeholder image while the image is being loaded. This decision was made to prevent overloading the main thread.
2. **`PokemonDetailView`**
  This view creates the Pokemon view shown when a Pokemon is tapped. It contains a larger image with white text for the name and a black background
3. **`PokemonListView`**
  This view presents the vertical grid scrolling view consisting of `PokemonView` and contains the logic to present `PokemonDetailView` when a Pokemon is tapped.  
  **Previous Version:** It also calls the `fetchPokemon` method to load more Pokemon in the view when the user is scrolling and 100px from the bottom of the screen. It is achieved using `GeometryReader` and `PreferenceKey`.  
  **Current Version:** Using SwiftUI's built-in `.onAppear` method, more Pokemon is loaded by calling the `fetchPokemon` method when the user is scrolling and nearing the bottom of the page.
  
  ### ViewModel Layer:
  The `PokemonListViewModel`handles the logic to fetch and load all the Pokemon data from the Model layer and pass it to the View Layer.
It implements a `fetchPokemon` method that triggers the `Service` to make the API calls to the PokeAPI with a `limit` and `offset` depending on the user's scrolling position.
It also implements a `selectPokemon` method to inform the `PokemonListView` about the Pokemon that has been tapped to present the `PokemonDetailView`.

## Frameworks:
`SwiftUI` and `Combine`
