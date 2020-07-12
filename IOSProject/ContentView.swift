//
//  ContentView.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext;
    @FetchRequest(fetchRequest: PokemonDAO.fetchAllPokemon()) var allTests:FetchedResults<PokemonDAO>;
    @State var pokedex: [Pokemon] = [];
    //Pokemon(name: "Pikachu", pokedexNumber: 7, type: PokemonType.thunder, description: "Souris Electrique", image: Image("pikachu")), Pokemon(name: "Carapuce", pokedexNumber: 4, type: PokemonType.water, description: "Tortue Hydro", image: Image("carapuce")), Pokemon(name: "Salamèche", pokedexNumber: 1, type: PokemonType.fire, description: "Salamandre de feu", image: Image("salamèche"))
    
    var body: some View {
        TabView {
            CollectionOverview(pokedex: self.$pokedex)
                .tabItem {
                    Text("Pokedex")
                    Image(systemName: "list.bullet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.environment(\.managedObjectContext, self.managedObjectContext)
            CollectionOverview(filtered: true, pokedex: self.$pokedex)
                .tabItem {
                    Text("Caught")
                    Image(systemName: "heart.fill")
            }.environment(\.managedObjectContext, self.managedObjectContext)
        }.onAppear {
            for pokemon in self.allTests {
                self.pokedex.append(pokemon.model);
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
