//
//  TrophyDetail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 3/18/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI
import MessageUI
import UIKit

struct TrophyDetail: View {
    @EnvironmentObject var filters: UserFilters
    @EnvironmentObject var activeBonus: ActiveBonus
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    @State var submit = false
    @State var primaryChanged = false
    @State var alternateChanged = false
    @State var showFilterPicker = false
    @State var gpsPressed = false
    @State public var useExistingPhoto: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var primaryImage: Image? = nil
    @State private var optionalImage: Image? = nil
    @State private var showPhotoModal: Bool = false
    @State private var memorialCode: String = ""
    @State private var imagePriority: String = ""
    @AppStorage("includePassenger") var includePassenger: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
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
                    //                    .lineLimit(nil)
                }
                .padding(.horizontal,8)
                
                VStack(spacing: 0.0) {
                    Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.sampleImage)!)
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
                    .padding(.horizontal, 5)
                    .padding(.bottom, 4)
                    
                    Text("\(self.activeBonus.gps)")
                        .lineLimit(nil)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .gesture(LongPressGesture(minimumDuration: 0.5).onEnded({_ in self.gpsPressed.toggle(); print("GPS link was activated"); openMaps(destGPS: self.activeBonus.gps) })
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
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "1"; self.memorialCode = self.activeBonus.code; }))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.memorialCode = self.activeBonus.code; }))
                        .sheet(isPresented: self.$showImagePicker, onDismiss: {self.primaryChanged = true; print("primaryImage is now: \(self.activeBonus.primaryImage)")}) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$primaryImage, memorialCode: self.$memorialCode, imagePriority: self.$imagePriority)
                                .modifier(SystemServices())
                            
                    }
                    Image(uiImage: ImageReader.getImageFromDocDir(named: self.activeBonus.alternateImage)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .gesture(TapGesture()
                            .onEnded({self.useExistingPhoto = false; self.showImagePicker = true; self.imagePriority = "2"; self.memorialCode = self.activeBonus.code;}))
                        .gesture(LongPressGesture(minimumDuration: 0.5)
                            .onEnded({_ in self.useExistingPhoto = true; self.showImagePicker = true; self.memorialCode = self.activeBonus.code;}))
                        .sheet(isPresented: self.$showImagePicker, onDismiss: {self.alternateChanged = true; print("alternateChanged is now: \(self.alternateChanged)")}) {
                            PhotoCaptureView(useExistingPhoto: self.$useExistingPhoto, showImagePicker: self.$showImagePicker, image: self.$optionalImage, memorialCode: self.$memorialCode,  imagePriority: self.$imagePriority)
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
                        MailView(result: self.$result, includePassenger: $includePassenger )
                            .modifier(SystemServices())
                    }
                }
                .padding(.vertical,8)
                Spacer()
            }
            .padding(8)
        }
    }
    
    func submitCapturedBonus(){
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "submitted", newVal: true)
    }
    
    func removeCapturedBonus(){
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "submitted", newVal: false)
        Bonus.updateBonusKey(code: self.activeBonus.code, key: "captured", newVal: false)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct TrophyDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BonusDetail().darkModeFix()
            BonusDetail().environment(\.colorScheme, .light)
        }
    }
}

