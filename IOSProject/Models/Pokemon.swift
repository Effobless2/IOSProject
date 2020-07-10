//
//  File.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI

func getColorFromType(type: PokemonType) -> Color {
    switch (type) {
        case PokemonType.fire:
            return Color.red;
        case PokemonType.water:
            return Color.blue;
        case PokemonType.thunder:
            return Color.yellow;
        default:
            return Color.green;
    }
}

enum PokemonType: String, CaseIterable, Identifiable {
    case fire, water, grass, thunder
    
    var id: PokemonType {
        return self
    }
}
class Pokemon: Identifiable, Equatable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id;
    }
    
    
    init(name: String, pokedexNumber: Int, type: PokemonType, description: String) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
        self.description = description;
        self.type = type;
        self.image = nil;
    }
    
    init(name: String, pokedexNumber: Int, type: PokemonType, description: String, image: Image?) {
        self.name = name;
        self.pokedexNumber = pokedexNumber;
        self.description = description;
        self.type = type;
        self.image = image;
    }
    
    let id = UUID();
    var name: String;
    var pokedexNumber: Int;
    var description: String;
    var type: PokemonType;
    var caught: Bool = false;
    var image: Image?;
}
