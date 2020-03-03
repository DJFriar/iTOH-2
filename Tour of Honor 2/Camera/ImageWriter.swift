////
////  ImageWriter.swift
////  Tour of Honor 2
////
////  Created by Tommy Craft on 3/2/20.
////  Copyright © 2020 Tommy Craft. All rights reserved.
////
//
import UIKit
import Foundation
class ImageWriter: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
