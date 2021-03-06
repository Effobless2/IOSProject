//
//  ImagePicker.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isShown: Bool;
    @Binding var image: Data?;
    
    init(isShown: Binding<Bool>, image: Binding<Data?>) {
        _isShown = isShown;
        _image = image;
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage;
        image = uiImage.pngData();
        isShown = false;
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false;
    }
}

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var isShown: Bool;
    @Binding var image: Data?;
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
        
    }
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image);
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController();
        picker.delegate = context.coordinator;
        return picker;
    }
}
