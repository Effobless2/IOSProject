//
//  NewElementForm.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct NewElementForm: View {
    @Environment(\.managedObjectContext) var managedObjectContext;
    @Environment(\.presentationMode) var presentation
    
    @State private var shownImagePicker: Bool = false;
    
    var currentPokedex: Pokedex? = nil;
    var currentPokemon: Pokemon? = nil;
    @State private var image: Image? = nil;
    @State private var name: String = "";
    @State private var pokedexNumber: String = "";
    @State private var pokemonType: PokemonType = PokemonType.fire;
    @State private var description: String = "";
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Pokedex Number", text: $pokedexNumber)
                    .keyboardType(.numberPad)
                Picker("Pokemon Type", selection: $pokemonType) {
                    ForEach(PokemonType.allCases) { cat in
                        Text(cat.rawValue).foregroundColor(getColorFromType(type: cat))
                    }
                }
                TextField("Description", text: $description)
                image?
                    .resizable()
                    .frame(width:150, height: 150)
                Button("Open Camera") {
                    self.shownImagePicker.toggle();
                }
                Section {
                    HStack {
                        Button("Save") {
                            if self.currentPokemon == nil && self.currentPokedex != nil {
                                let pokemon = Pokemon(name: self.name, pokedexNumber: Int(self.pokedexNumber) ?? 0, type: self.pokemonType, description: self.description, image: self.image);
                                let dao: PokemonDAO = pokemon.genDAO(context: self.managedObjectContext);
                                do {
                                    try self.managedObjectContext.save();
                                    self.currentPokedex?.add(dao.model);
                                } catch {
                                    print(error);
                                }
                                
                                
                            } else {
                                self.currentPokemon?.name = self.name;
                                self.currentPokemon?.description = self.description;
                                self.currentPokemon?.type = self.pokemonType;
                                self.currentPokemon?.pokedexNumber = Int(self.pokedexNumber) ?? 0;
                                self.currentPokemon?.image = self.image;
                                let dao: PokemonDAO = self.currentPokemon!.genDAO(context: self.managedObjectContext);
                                do {
                                    try self.managedObjectContext.save();
                                    self.currentPokedex?.add(dao.model);
                                } catch {
                                    print(error);
                                }
                            }
                            
                            self.presentation.wrappedValue.dismiss();
                        }
                    }
                }
                
            }.navigationBarItems(trailing: Button(action: {
                self.presentation.wrappedValue.dismiss();
            }) {
                Text("Cancel")
            })
        }.sheet(isPresented: self.$shownImagePicker) {
            PhotoCaptureView(isShown: self.$shownImagePicker, image: self.$image)
        }.onAppear {
            if self.currentPokemon != nil {
                self.image = self.currentPokemon!.image;
                self.name = self.currentPokemon!.name;
                self.pokedexNumber = String(self.currentPokemon!.pokedexNumber);
                self.pokemonType = self.currentPokemon!.type;
                self.description = self.currentPokemon!.description;
            }
        }
        
    }
}

struct NewElementForm_Previews: PreviewProvider {
    static var previews: some View {
        NewElementForm(currentPokedex: Pokedex(name: "Test"))
    }
}
