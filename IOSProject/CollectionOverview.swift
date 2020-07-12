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
    @Binding var pokedex: [Pokemon];
    var body: some View {
        NavigationView {
            self.placeholder ? EmptyView() : EmptyView()
            List(!self.filtered ? self.pokedex.sorted {
                $0.pokedexNumber < $1.pokedexNumber;
            } : self.pokedex.sorted {
                $0.pokedexNumber < $1.pokedexNumber;
            }.filter {
                $0.caught
            }) { pokemon in
                NavigationLink(destination: PokemonDescriptionView(pokemon: pokemon, pokedex: self.$pokedex)) {
                    Text(pokemon.name).foregroundColor(getColorFromType(type: pokemon.type))
                }
            }
            .navigationBarTitle("Johto")
            .navigationBarItems(trailing: Button(action: {
                self.isAddingElement.toggle();
            }) {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $isAddingElement) {
                    NewElementForm(currentPokedex: self.$pokedex)
                        .environment(\.managedObjectContext, self.managedObjectContext)
            }
        }.onAppear {
            self.placeholder.toggle();
        }
    }
}

struct CollectionOverview_Previews: PreviewProvider {
    @State static var pokemon: [Pokemon] = [];
    static var previews: some View {
        CollectionOverview(pokedex: self.$pokemon)
    }
}
