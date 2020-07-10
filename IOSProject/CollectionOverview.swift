//
//  CollectionOverview.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CollectionOverview: View {
    @State private var isAddingElement = false;
    var pokedex: Pokedex;
    var body: some View {
        NavigationView {
            List(self.pokedex.all().sorted {
                $0.pokedexNumber < $1.pokedexNumber;
            }) { pokemon in
                NavigationLink(destination: PokemonDescriptionView(pokemon: pokemon)) {
                    Text(pokemon.name).foregroundColor(getColorFromType(type: pokemon.type))
                }
            }
            .navigationBarTitle(pokedex.name)
            .navigationBarItems(trailing: Button(action: {
                self.isAddingElement.toggle();
            }) {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $isAddingElement) {
                    NewElementForm(currentPokedex: self.pokedex)
            }
        }
    }
}

struct CollectionOverview_Previews: PreviewProvider {
    static var previews: some View {
        CollectionOverview(pokedex: Pokedex(name:"test", pokemons:[]))
    }
}
