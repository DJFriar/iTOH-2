//
//  PhotoCaptureView.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 1/27/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    @EnvironmentObject var activeBonus: ActiveBonus

    @Binding var useExistingPhoto: Bool
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var testMe: String
    @Binding var imagePriority: String
    
    var body: some View {
        ImagePicker(showImagePicker: $showImagePicker, useExistingPhoto: $useExistingPhoto, isShown: $showImagePicker, image: $image, testMe: $testMe, imagePriority: $imagePriority)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(useExistingPhoto: .constant(false), showImagePicker: .constant(false), image: .constant(Image("")),testMe: .constant(""), imagePriority: .constant(""))
    }
}
