//
//  NewElementForm.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct NewElementForm: View {
    @Environment(\.presentationMode) var presentation

    var collection: MyCollection;
    @State private var name: String = "";
    var body: some View {
        NavigationView {
            Form {
                TextField("Element name", text: $name)
                Section {
                    HStack {
                        Button("Save") {
                            let element = MyElement(name: self.name);
                            self.collection.add(element);
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                }
                
            }.navigationBarItems(trailing: Button(action: {
                self.presentation.wrappedValue.dismiss();
            }) {
                Text("Cancel")
            })
        }
        
    }
}

struct NewElementForm_Previews: PreviewProvider {
    static var previews: some View {
        NewElementForm(collection: MyCollection(name: "Caca"))
    }
}
