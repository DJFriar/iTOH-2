//
//  BonusDetail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI
import MessageUI
import UIKit

struct BonusDetail: View {
    @EnvironmentObject var filters: UserFilters
    @EnvironmentObject var activeBonus: ActiveBonus
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var answerSubmitButton = false
    @State var answerResetButton = false
    
    @State var submit = false
    @State var primaryChanged = false
    @State var imageWasAccepted = false
    @State var alternateChanged = false
    @State var showFilterPicker = false
    @State var gpsPressed = false
    @State public var useExistingPhoto: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var primaryImage: Image? = nil
    @State private var optionalImage: Image? = nil
    @State private var showPhotoModal: Bool = false
    @State private var testMe: String = ""
    @State private var imagePriority: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var riderFlagNumber = UserDefaultsConfig.riderFlagNumber
    var sampleImageMissing = ImageReader.getImageFromDocDir(named: "sample_image_missing.png")
    //    var primaryImageMissing = ImageReader.getImageFromDocDir(named: "no_image_taken.png")
    //    var optionalImageMissing = ImageReader.getImageFromDocDir(named: "optional_2nd_Image.png")
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 5) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrow.turn.up.left") // set image here
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.primary)
                            Text("Back")
                        }
                        Spacer()
                    }
                    .padding(.bottom,8)
                    Image(systemName: self.activeBonus.submitted ? "checkmark.shield.fill" : "checkmark.shield")
                        .opacity(self.activeBonus.captured ? 100 : 0)
                }
                
                HStack {
                    Text(self.activeBonus.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding(.leading,8)
                
                HStack {
                    Spacer()
                    Text("\(self.activeBonus.city), \(self.activeBonus.state)")
                }
                .padding(.horizontal,8)
                
                VStack(spacing: 0.0) {
                    if (ImageReader.getImageFromDocDir(named: self.activeBonus.sampleImage) != nil){
                        Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.sampleImage)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    } else {
                        Image(uiImage: self.sampleImageMissing!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
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
                    .padding(.horizontal, 5)
                    .padding(.bottom, 4)
                    
                    Text("\(self.activeBonus.gps)")
                        .lineLimit(nil)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .gesture(LongPressGesture(minimumDuration: 0.5).onEnded({_ in self.gpsPressed.toggle(); openMaps(destGPS: self.activeBonus.gps) })
                    )
                }
                .padding(.bottom, 4)
                
                VStack {
                    Divider()
                    Text("My Bonus Images")
                        .font(.headline)
                        .padding(.top, 4)
                }
                HStack {
                    Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.primaryImage)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "1"; self.testMe = self.activeBonus.code; }))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.imagePriority = "1"; self.testMe = self.activeBonus.code; }))
                        .sheet(isPresented: self.$showImagePicker, onDismiss: {self.checkForSavedPhoto() }) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$primaryImage, testMe: self.$testMe, imagePriority: self.$imagePriority)
                                .modifier(SystemServices())
                            
                    }
                    Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.alternateImage)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "2"; self.testMe = self.activeBonus.code;}))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.imagePriority = "2"; self.testMe = self.activeBonus.code;}))
                        .sheet(isPresented: self.$showImagePicker, onDismiss: {self.checkForSavedPhoto() }) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$optionalImage, testMe: self.$testMe,  imagePriority: self.$imagePriority)
                                .modifier(SystemServices())
                    }
                }
                HStack {
                    Button(action: {
                        self.removeCapturedBonus()
//                        self.deletedCapturedImage(testMe: self.activeBonus.code, imagePriority: self.imagePriority)
                    }) {
                        Text("Reset Bonus")
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    SubmitButton()
                        .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $answerSubmitButton) {
                                MailView(result: self.$result)
                                    .modifier(SystemServices())
                    }
                }
                .padding(.vertical,8)
                Spacer()
            }
            .padding(8)
        }
    }
    
    func checkForSavedPhoto(){
        if (ImageReader.getImageFromDocDir(named: "2020_\(self.riderFlagNumber)_\(self.testMe)_\(self.imagePriority).jpg") != nil) {
            if self.imagePriority == "1" {
                self.activeBonus.primaryImage = "2020_\(self.riderFlagNumber)_\(self.testMe)_\(self.imagePriority).jpg"
                self.primaryChanged = true
            } else if self.imagePriority == "2" {
                self.activeBonus.alternateImage = "2020_\(self.riderFlagNumber)_\(self.testMe)_\(self.imagePriority).jpg"
                self.alternateChanged = true
            } else {
                print("checkForSavedPhoto caught an invalid number.")
            }
        }
    }
    
    func markBonusSubmitted(){
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "submitted", newVal: true)
    }
    
    func removeCapturedBonus(){
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "submitted", newVal: false)
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "captured", newVal: false)
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "primaryImage", newVal: "no_image_taken.png")
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "alternateImage", newVal: "optional_2nd_Image.png")
        self.answerResetButton.toggle()
    }
    
//    func deletedCapturedImage(testMe: String, imagePriority: String) {
//        let fileManager = FileManager.default
//        let filename1 = getDocumentsDirectory().appendingPathComponent("2020_\(riderFlagNumber)_\(self.activeBonus.code)_1.jpg")
//        let filename2 = getDocumentsDirectory().appendingPathComponent("2020_\(riderFlagNumber)_\(self.activeBonus.code)_2.jpg")
//        print("Deleting image named \"2020_\(riderFlagNumber)_\(self.activeBonus.code)_*.jpg")
//        try? fileManager.removeItem(at: filename1)
//        try? fileManager.removeItem(at: filename2)
//    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    public func SubmitButton() -> Button<Text> {
        return Button(action: {
            self.markBonusSubmitted()
            self.answerSubmitButton.toggle()
        }) {
            Text("Submit Bonus")
        }
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

