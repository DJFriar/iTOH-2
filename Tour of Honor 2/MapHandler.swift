//
//  OpenMaps.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/17/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

public func openMaps(destGPS: String) {
    
    let useGoogleMaps = UserDefaultsConfig.useGoogleMaps
    let trimmedDestGPS = destGPS.replacingOccurrences(of: " ", with: "")
    print(trimmedDestGPS)
    
    if useGoogleMaps {
        // Open Google Maps
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            UIApplication.shared.open(URL(string:"comgooglemaps://?daddr=\(trimmedDestGPS)&directionsmode=driving")!)
        } else {
            print("Google Maps not installed")
            //        self.showGoogleMapsNotInstalledAlert()
        }
    } else {
        // Open Apple Maps
        UIApplication.shared.open(URL(string:"http://maps.apple.com/maps?saddr=&daddr=\(trimmedDestGPS)")!)
    }
}

