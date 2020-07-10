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
    var body: some View {
        Text(pokemon.name)
    }
}

struct PokemonDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDescriptionView(pokemon: Pokemon(name: "test"))
    }
}
