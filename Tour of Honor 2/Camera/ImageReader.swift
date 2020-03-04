//
//  ImageReader.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/3/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import Foundation
import UIKit

class ImageReader: NSObject {
    
    static func getImageFromDocDir(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}


