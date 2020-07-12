//
//  PhotoCaptureView.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    @Binding var isShown: Bool;
    @Binding var image: Data?;
    var body: some View {
        ImagePicker(isShown: $isShown, image: $image)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(isShown: .constant(false), image: .constant(nil))
    }
}
