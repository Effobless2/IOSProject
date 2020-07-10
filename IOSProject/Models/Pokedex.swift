//
//  MyCollection.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class Pokedex {
    private var pokemons: [Pokemon];
    var name: String;
    
    init(name: String) {
        self.name = name;
        pokemons = []
    }
    
    init(name: String, pokemons: [Pokemon]) {
        self.name = name;
        self.pokemons = pokemons;
    }
    
    func add(_ pokemon: Pokemon) {
        pokemons.append(pokemon);
    }
    
    func all() -> [Pokemon] {
        return pokemons;
    }
}
