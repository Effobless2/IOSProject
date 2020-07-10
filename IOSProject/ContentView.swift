//
//  ContentView.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var myCollection = Pokedex(name: "Johto", pokemons: [Pokemon(name: "Pikachu", pokedexNumber: 7, type: PokemonType.thunder, description: "Souris Electrique", image: Image("pikachu")), Pokemon(name: "Carapuce", pokedexNumber: 4, type: PokemonType.water, description: "Tortue Hydro", image: Image("carapuce")), Pokemon(name: "Salamèche", pokedexNumber: 1, type: PokemonType.fire, description: "Salamandre de feu", image: Image("salamèche"))]);
    
    var body: some View {
        TabView {
            CollectionOverview(pokedex: self.myCollection)
                .tabItem {
                    Text("My Elements")
                    Image(systemName: "list.bullet")
            }
            Sandbox()
                .tabItem {
                    Text("Placeholder")
                    Image(systemName: "cart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
