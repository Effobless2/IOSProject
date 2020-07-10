//
//  ContentView.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var myCollection = Pokedex(name: "Johto", pokemons: [Pokemon(name: "Pikachu"), Pokemon(name: "Carapuce"), Pokemon(name: "Salamèche")]);
    
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
