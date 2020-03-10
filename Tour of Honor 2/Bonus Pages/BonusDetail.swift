//
//  BonusDetail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusDetail: View {
    @EnvironmentObject var filters: UserFilters
    @EnvironmentObject var activeBonus: ActiveBonus

    @State var submit = false
    @State var showFilterPicker = false
    @State public var useExistingPhoto: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var primaryImage: Image? = nil
    @State private var optionalImage: Image? = nil
    @State private var showPhotoModal: Bool = false
    @State private var testMe: String = ""
    @State private var imagePriority: String = ""
    @Environment(\.presentationMode) var presentationMode

    var PriImageName = "no_image_taken"
    var OptImageName = "optional_2nd_Image"
    var priImageMissing = ImageReader.getImageFromDocDir(named: "no_image_taken.png")
    var optImageMissing = ImageReader.getImageFromDocDir(named: "optional_2nd_Image.png")
    var takenPriImage = ImageReader.getImageFromDocDir(named: "copy.jpg")
    
    var body: some View {

            VStack(spacing: 5) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                        Image("ic_back") // set image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            Text("Go back")
                        }
                    Spacer()
                }
                .padding(.bottom,12)
                HStack {
                    Text(self.activeBonus.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding(.leading,8)
               
                HStack {
                    ZStack {
                        HStack {
                            Image(systemName: "checkmark.shield")
                                .opacity(self.activeBonus.captured ? 100 : 0)
                            Spacer()
                        }
                        HStack {
                            Text("\(self.activeBonus.city), \(self.activeBonus.state)")
                                .lineLimit(nil)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            Text("\(self.activeBonus.gps)")
                                .lineLimit(nil)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            }
                        }
                }
                VStack(spacing: 0.0) {
                    Image(self.activeBonus.sampleImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    HStack {
                        Text(self.activeBonus.category)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(self.activeBonus.code)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 5.0)
                }
                .padding(.bottom, 10.0)
                VStack {
                    Divider()
                    Text("My Bonus Images")
                        .font(.headline)
                        .padding(.top, 10.0)
                }
                HStack {
                    Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.primaryImage) ?? priImageMissing!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "1"; self.testMe = self.activeBonus.code}))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.testMe = self.activeBonus.code}))
                        .sheet(isPresented: self.$showImagePicker) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$primaryImage, testMe: self.$testMe, imagePriority: self.$imagePriority)
                            .modifier(SystemServices())
                    }
                    Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.alternateImage) ?? optImageMissing!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "2"; self.testMe = self.activeBonus.code}))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.testMe = self.activeBonus.code}))
                        .sheet(isPresented: self.$showImagePicker) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$optionalImage, testMe: self.$testMe,  imagePriority: self.$imagePriority)
                            .modifier(SystemServices())
                    }
                }
                HStack {
                    Button(action: { self.removeCapturedBonus() }) {
                        Text("Reset Bonus")
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    Button(action: { self.submitCapturedBonus() }) {
                        Text("Submit Bonus")
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.vertical,8)
                Spacer()
            }
            .padding(8)
    }
   
    func submitCapturedBonus(){
        Bonus.updateCapturedFlag(state: true, code: self.activeBonus.code)
    }
    
    func removeCapturedBonus(){
        Bonus.updateCapturedFlag(state: false,code: self.activeBonus.code)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct BonusDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BonusDetail().darkModeFix()
            BonusDetail().environment(\.colorScheme, .light)
        }
    }
}
