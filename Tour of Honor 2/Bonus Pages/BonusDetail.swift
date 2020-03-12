//
//  BonusDetail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI
import MessageUI

struct BonusDetail: View {
    @EnvironmentObject var filters: UserFilters
    @EnvironmentObject var activeBonus: ActiveBonus
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    @State var submit = false
    @State var primaryChanged = false
    @State var alternateChanged = false
    @State var showFilterPicker = false
    @State public var useExistingPhoto: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var primaryImage: Image? = nil
    @State private var optionalImage: Image? = nil
    @State private var showPhotoModal: Bool = false
    @State private var testMe: String = ""
    @State private var imagePriority: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var sampleImageMissing = ImageReader.getImageFromDocDir(named: "sample_image_missing.png")
    var primaryImageMissing = ImageReader.getImageFromDocDir(named: "no_image_taken.png")
    var optionalImageMissing = ImageReader.getImageFromDocDir(named: "optional_2nd_Image.png")
    
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
                        Image(systemName: self.activeBonus.submitted ? "checkmark.shield.fill" : "checkmark.shield")
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
                Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.sampleImage) ?? sampleImageMissing!)
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
                Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.primaryImage)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .gesture(TapGesture()
                        .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "1"; self.testMe = self.activeBonus.code; }))
                    .gesture(LongPressGesture(minimumDuration: 0.5)
                        .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.testMe = self.activeBonus.code; }))
                    .sheet(isPresented: self.$showImagePicker, onDismiss: {self.primaryChanged = true}) {
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
                        .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.testMe = self.activeBonus.code;}))
                    .sheet(isPresented: self.$showImagePicker, onDismiss: {self.alternateChanged = true;}) {
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
                Button(action: {
                    self.submitCapturedBonus()
                    self.isShowingMailView.toggle()
                }) {
                    Text("Submit Bonus")
                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMailView) {
                    MailView(result: self.$result)
                }
            }
            .padding(.vertical,8)
            Spacer()
        }
        .padding(8)
    }
    
    func submitCapturedBonus(){
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "submitted", newVal: true)
        //        MailView.presentMailCompose()
    }
    
    func removeCapturedBonus(){
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "submitted", newVal: false)
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "captured", newVal: false)
        //        Bonus.updateCapturedFlag(state: false,code: self.activeBonus.code)
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
