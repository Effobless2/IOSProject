//
//  MainView.swift
//  IOSProject
//
//  Created by Developer on 11/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext;
    @FetchRequest(fetchRequest: PokemonDAO.fetchAllPokemon()) var allTests:FetchedResults<PokemonDAO>;
    var myCollection = Pokedex(name: "Johto", pokemons: []);
    @State private var isAddingElement = false;
    
    var body: some View {
        TabView {
            CollectionOverview(pokedex: self.myCollection)
                .tabItem {
                    Text("My Elements")
                    Image(systemName: "list.bullet")
            }.environment(\.managedObjectContext, self.managedObjectContext)
            CollectionOverview(filtered: true, pokedex: self.myCollection)
                .tabItem {
                    Text("Placeholder")
                    Image(systemName: "cart")
            }.environment(\.managedObjectContext, self.managedObjectContext)
        }.navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Button(action: {
            self.isAddingElement.toggle();
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isAddingElement) {
            NewElementForm(currentPokedex: self.myCollection)
                .environment(\.managedObjectContext, self.managedObjectContext)
        }
        .onAppear {
            for pokemon in self.allTests {
                self.myCollection.add(pokemon.model);
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
