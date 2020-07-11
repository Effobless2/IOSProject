//
//  CollectionOverview.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CollectionOverview: View {
    @Environment(\.managedObjectContext) var managedObjectContext;
    @State private var isAddingElement = false;
    @State private var placeholder = false;
    var filtered = false;
    var pokedex: Pokedex;
    var body: some View {
        NavigationView {
            self.placeholder ? EmptyView() : EmptyView()
            List(!self.filtered ? self.pokedex.all().sorted {
                $0.pokedexNumber < $1.pokedexNumber;
            } : self.pokedex.all().sorted {
                $0.pokedexNumber < $1.pokedexNumber;
            }.filter {
                $0.caught
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
                        .environment(\.managedObjectContext, self.managedObjectContext)
            }
        }.onAppear {
            self.placeholder.toggle();
        }
    }
}

struct CollectionOverview_Previews: PreviewProvider {
    static var previews: some View {
        CollectionOverview(pokedex: Pokedex(name:"test", pokemons:[]))
    }
}
