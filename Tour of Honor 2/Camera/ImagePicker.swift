//
//  ImagePicker.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 1/27/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import Foundation
import SwiftUI
import Photos
import CoreLocation

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    var testMe: String

    init(isShown: Binding<Bool>, image: Binding<Image?>, testMe: String) {
        _isShown = isShown
        _image = image
        self.testMe = testMe
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
        //print(uiImage.size)
        //print(info)
        //print("-----")
        //print(UIImagePickerController.InfoKey.originalImage)
        print("-----")
        print(self.testMe)
        print("-----")


        let imageSaver = ImageWriter()
        imageSaver.writeToAppData(image: uiImage)
        imageSaver.writeToPhotoAlbum(image: uiImage)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var showImagePicker: Bool
    @Binding var useExistingPhoto: Bool
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var testMe: String
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image, testMe: testMe)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        if !useExistingPhoto {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        return picker
    }
}
