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
    
    @State private var shownImagePicker: Bool = false;
    @State private var image: Image? = nil;
    var collection: MyCollection;
    @State private var name: String = "";
    var body: some View {
        NavigationView {
            Form {
                TextField("Element name", text: $name)
                image?
                    .resizable()
                    .frame(width:150, height: 150)
                Button("Open Camera") {
                    self.shownImagePicker.toggle();
                }
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
        }.sheet(isPresented: self.$shownImagePicker) {
            PhotoCaptureView(isShown: self.$shownImagePicker, image: self.$image)
        }
        
    }
}

struct NewElementForm_Previews: PreviewProvider {
    static var previews: some View {
        NewElementForm(collection: MyCollection(name: "Caca"))
    }
}
