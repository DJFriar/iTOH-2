//
//  PhotoModal.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/9/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct PhotoModal: View {
    @Environment(\.presentationMode) var presentationMode
    @State var useExistingPhoto: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.useExistingPhoto = true
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Take Photo")
            }.padding(.bottom, 50)
            
            Button(action: {
                self.useExistingPhoto = false
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Choose Photo")
            }.padding(.bottom, 50)
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.padding(.bottom, 50)
            
        }
    }
}

struct PhotoModal_Previews: PreviewProvider {
    static var previews: some View {
        PhotoModal()
    }
}
