//
//  PokemonDescriptionView.swift
//  IOSProject
//
//  Created by Developer on 10/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct PokemonDescriptionView: View {
    let pokemon: Pokemon;
    @State var caught: Bool = false;
    @State private var isEditing = false;

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    Text(pokemon.name).font(.title)
                    Text("N° de Pokédex : \(pokemon.pokedexNumber)")
                    HStack {
                        Text("Type :")
                        Text(pokemon.type.rawValue)
                            .foregroundColor(getColorFromType(type: pokemon.type))
                    }
                }.padding()
                Spacer()
                pokemon.image?
                    .resizable()
                    .frame(width:150, height: 150)
                    .padding()
                    
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            Text(pokemon.description)
            Text(self.caught ? "" : "")//MDRRRR
            Spacer()
            Button("Update", action: {
                self.isEditing.toggle();
            })
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarItems(trailing: Button(action: {
            self.pokemon.caught.toggle();
            self.caught.toggle();
       }) {
        Image(pokemon.caught ? "red_ball" : "black_ball")
            .resizable()
            .frame(width:20, height: 20)
        })
        .background(pokemon.image?
            .resizable()
            .frame(width:300, height: 300)
            .opacity(0.3))
        .onAppear {
            self.caught = self.pokemon.caught;
        }.sheet(isPresented: $isEditing) {
            NewElementForm(currentPokedex: nil, currentPokemon: self.pokemon)
        }
    }
}

struct PokemonDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDescriptionView(pokemon: Pokemon(name: "test", pokedexNumber: 0, type: PokemonType.fire, description: "Test", image: Image("carapuce")))
    }
}
