////
////  ImageWriter.swift
////  Tour of Honor 2
////
////  Created by Tommy Craft on 3/2/20.
////  Copyright © 2020 Tommy Craft. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//class ImageWriter: UIViewController {
//
//    var filePath = ""
//
//    enum StorageType {
//        case userDefaults
//        case fileSystem
//    }
//
//    private func store(image: UIImage,
//                       forKey key: String,
//                       withStorageType storageType: StorageType) {
//        if let pngRepresentation = image.pngData() {
//            switch storageType {
//            case .fileSystem:
//                if let filePath = filePath(forKey: key) {
//                    do  {
//                        try pngRepresentation.write(to: filePath,
//                                                    options: .atomic)
//                    } catch let err {
//                        print("Saving file resulted in error: ", err)
//                    }
//                }
//            case .userDefaults:
//                UserDefaults.standard.set(pngRepresentation,
//                                          forKey: key)
//            }
//        }
//    }
//
//    private func retrieveImage(forKey key: String,
//                               inStorageType storageType: StorageType) -> UIImage? {
//        switch storageType {
//        case .fileSystem:
//            if let filePath = self.filePath(forKey: key),
//                let fileData = FileManager.default.contents(atPath: filePath.path),
//                let image = UIImage(data: fileData) {
//                return image
//            }
//        case .userDefaults:
//            if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
//                let image = UIImage(data: imageData) {
//                return image
//            }
//        }
//
//        return nil
//    }
//}
