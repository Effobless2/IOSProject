//
//  CollectionOverview.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CollectionOverview: View {
    @State private var isAddingElement = false
    var collection = MyCollection(name: "Pokedex", elements: [MyElement(name: "Pikachu"), MyElement(name: "Carapuce"), MyElement(name: "Salamèche")]);
    var body: some View {
        NavigationView {
            List(self.collection.all()) { element in
                Text(element.name)
            }
            .navigationBarTitle(collection.name)
            .navigationBarItems(trailing: Button(action: {
                self.isAddingElement.toggle();
            }) {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $isAddingElement) {
                    NewElementForm(collection: self.collection)
            }
            
        }
    }
}

struct CollectionOverview_Previews: PreviewProvider {
    static var previews: some View {
        CollectionOverview(collection: MyCollection(name:"", elements:[]))
    }
}
