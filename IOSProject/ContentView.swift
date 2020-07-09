//
//  ContentView.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var myCollection = MyCollection(name: "Pokedex", elements: [MyElement(name: "Pikachu"), MyElement(name: "Carapuce"), MyElement(name: "Salamèche")]);
    
    var body: some View {
        TabView {
            CollectionOverview(collection: self.myCollection)
                .tabItem {
                    Text("My Elements")
                    Image(systemName: "list.bullet")
            }
            Text("Placeholdered")
                .tabItem {
                    Text("Placeholder")
                    Image(systemName: "cart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
