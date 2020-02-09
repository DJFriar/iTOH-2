//
//  CustomModifiers.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/9/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct RowViewLine3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.top, 4)
    }
}

//extension UIApplication {
//    static var appVersion: String? {
//        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
//    }
//}
