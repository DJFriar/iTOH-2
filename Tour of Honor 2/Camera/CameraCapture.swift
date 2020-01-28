//
//  CameraCapture.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 1/27/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct CameraCapture: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            
            image?.resizable()
                .scaledToFit()
            
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Choose photos")
            }.sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }
            
        }
    }
}

struct CameraCapture_Previews: PreviewProvider {
    static var previews: some View {
        CameraCapture()
    }
}
