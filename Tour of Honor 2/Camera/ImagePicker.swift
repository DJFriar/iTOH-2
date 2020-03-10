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
    var imagePriority: String

    init(isShown: Binding<Bool>, image: Binding<Image?>, testMe: String, imagePriority: String) {
        _isShown = isShown
        _image = image
        self.testMe = testMe
        self.imagePriority = imagePriority
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
        imageSaver.writeToAppData(image: uiImage, testMe: testMe, imagePriority: imagePriority)
        imageSaver.writeToPhotoAlbum(image: uiImage)
        let filename = "2020_\(UserDefaultsConfig.riderFlagNumber)_\(testMe)_\(imagePriority).jpg"
        switch imagePriority {
        case "1":
            Bonus.updateBonusKey(code: testMe, key: "primaryImage", newVal: filename )
        case "2":
            Bonus.updateBonusKey(code: testMe, key: "alternateImage", newVal: filename )
        default:
            print("not sure which image that was...")
        }
        
        
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
    @Binding var imagePriority: String
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image, testMe: testMe, imagePriority: imagePriority)
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
