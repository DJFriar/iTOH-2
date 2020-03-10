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
    var riderFlagNumber = UserDefaultsConfig.riderFlagNumber
    var testMe: String = "XXX"
    var imagePriority: String = "X"
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    func writeToAppData(image: UIImage, testMe: String, imagePriority: String) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("2020_\(riderFlagNumber)_\(testMe)_\(imagePriority).jpg")
            try? data.write(to: filename)
            print("image written ... I think")
        }
    }
    
    // Copy required images to document directory
        static func copyFilesFromBundleToDocumentsFolderWith(fileExtension: String) {
            print("Copying required imagery...")
            if let resPath = Bundle.main.resourcePath {
                do {
                    let dirContents = try FileManager.default.contentsOfDirectory(atPath: resPath)
                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                    let filteredFiles = dirContents.filter{ $0.contains(fileExtension)}
                    for fileName in filteredFiles {
                        if let documentsURL = documentsURL {
                            let sourceURL = Bundle.main.bundleURL.appendingPathComponent(fileName)
                            let destURL = documentsURL.appendingPathComponent(fileName)
                            do { try FileManager.default.copyItem(at: sourceURL, to: destURL) } catch { }
                        }
                    }
                } catch { }
            }
        }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

