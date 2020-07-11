//
//  ContentView.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext;
    //Pokemon(name: "Pikachu", pokedexNumber: 7, type: PokemonType.thunder, description: "Souris Electrique", image: Image("pikachu")), Pokemon(name: "Carapuce", pokedexNumber: 4, type: PokemonType.water, description: "Tortue Hydro", image: Image("carapuce")), Pokemon(name: "Salamèche", pokedexNumber: 1, type: PokemonType.fire, description: "Salamandre de feu", image: Image("salamèche"))
    @State private var changeView = false;
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: MainView().environment(\.managedObjectContext, self.managedObjectContext), isActive: $changeView) {
                Image("front")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("Pokedex")
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.changeView = true;
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
