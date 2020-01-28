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
    @State private var showImagePicker: Bool = false
    @State private var primaryImage: Image? = nil
    @State private var optionalImage: Image? = nil
    
    var bonusName = "Something in Nevada"
    var bonusCode = "NV4"
    var bonusCategory = "Tour of Honor"
    var city = "Reno"
    var state = "NV"
    var sampleImage = "2019nv4"
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text(bonusName)
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack {
                Image(systemName: "checkmark.shield")
                Text("\(city), \(state)")
                    .lineLimit(nil)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Spacer()
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
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Image("no_image_taken")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                }.sheet(isPresented: self.$showImagePicker) {
                    PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$primaryImage)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("optional_2nd_Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                }
            }
            HStack {
                Button(action: { self.submit.toggle() }) {
                    Text("Reset Bonus")
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Button(action: { self.submit.toggle() }) {
                    Text("Submit Bonus")
                        .multilineTextAlignment(.center)
                }
            }
            Divider()
            Text("Bonus Info")
                .font(.headline)
            Text("This is a paragraph to describe the bonus details and test the word wrapping of the text field. Nifty details about the bonus itself would go here.")
                .font(.body)
                //                            Text("This is another paragraph to describe the bonus details and test the word wrapping of the text field. Nifty details about the bonus itself would go here.")
                .font(.body)
            Spacer()
        }
        .padding(30.0)
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
