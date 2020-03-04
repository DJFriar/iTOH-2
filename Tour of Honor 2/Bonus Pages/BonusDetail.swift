//
//  BonusDetail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusDetail: View {
    @State var submit = false
    @State public var useExistingPhoto: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var primaryImage: Image? = nil
    @State private var optionalImage: Image? = nil
    @State private var showPhotoModal: Bool = false
    
    var PriImageName = "no_image_taken"
    var OptImageName = "optional_2nd_Image"
    var priImageMissing = ImageReader.getImageFromDocDir(named: "no_image_taken.png")
    var optImageMissing = ImageReader.getImageFromDocDir(named: "optional_2nd_Image.png")
    var takenPriImage = ImageReader.getImageFromDocDir(named: "copy.jpg")
    
    var id = "x"
    var bonusName = "x"
    var bonusCode = "x"
    var bonusCategory = "x"
    var city = "x"
    var state = "x"
    var gps = "x"
    var sampleImage = "x"
    var captured = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Text(bonusName)
                    .font(.title)
                    .fontWeight(.heavy)
                HStack {
                    ZStack {
                        HStack {
                            Image(systemName: "checkmark.shield")
                                .opacity(captured ? 100 : 0)
                            Spacer()
                        }
                        HStack {
                            Text("\(city), \(state)")
                                .lineLimit(nil)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            Text("\(gps)")
                                .lineLimit(nil)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                VStack(spacing: 0.0) {
                    Image(sampleImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    HStack {
                        Text(bonusCategory)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(bonusCode)
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
                    Image(uiImage: priImageMissing!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true}))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true}))
                        .sheet(isPresented: self.$showImagePicker) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$primaryImage)
                    }
                    Image(uiImage: optImageMissing!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true}))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true}))
                        .sheet(isPresented: self.$showImagePicker) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$optionalImage)
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
    }
    func submitCapturedBonus(){
        Bonus.updateCapturedFlag(state: true, code: bonusCode)
    }
    func removeCapturedBonus(){
        Bonus.updateCapturedFlag(state: false,code: bonusCode)

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
