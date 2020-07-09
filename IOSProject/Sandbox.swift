//
//  Sandbox.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct Sandbox: View {
    @State private var shownImagePicker: Bool = false;
    @State private var image: Image? = nil;
    var body: some View {
        VStack {
            image?.resizable()
                .scaledToFit()
            Button("Open Camera") {
                self.shownImagePicker.toggle();
            }
        }.sheet(isPresented: self.$shownImagePicker) {
            PhotoCaptureView(isShown: self.$shownImagePicker, image: self.$image)
        }
        
    }
}

struct Sandbox_Previews: PreviewProvider {
    static var previews: some View {
        Sandbox()
    }
}
