//
//  Settings.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct Settings: View {
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]! as? String
    let appBuild = Bundle.main.infoDictionary!["CFBundleVersion"]! as? String
    @State var showSettings = false
    @State var trophyHunter = UserDefaultsConfig.trophyHunter
    @State var useGoogleMaps = UserDefaultsConfig.useGoogleMaps
    @State var riderFlagNumber = UserDefaultsConfig.riderFlagNumber
    @State var pillionFlagNumber = UserDefaultsConfig.pillionFlagNumber
    @State var initialActiveTab = UserDefaultsConfig.initialActiveTab
    @State var submit = false
    
    //    // Used for Location Tracking
    //    @ObservedObject var locationManager = LocationManager()
    //    var userLatitude: String {
    //        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    //    }
    //
    //    var userLongitude: String {
    //        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    //    }
    
    // Set Device Info
    let systemVersion = UIDevice.current.systemVersion
    let modelName = UIDevice.current.modelName
    
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.label))
                Spacer()
                Image("toh_logo")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 45, height: 45)
                
            }
            .padding(.horizontal,8)
            .padding(.top,8)
            Form {
                Section(header: Text("Rider Details")) {
                    HStack {
                        Text("Rider Number")
                        Spacer()
                        TextField("000", text: $riderFlagNumber)
                            .frame(width: 70.0, height: 0.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numbersAndPunctuation)
                    }
                    
                    HStack {
                        Text("Passenger Number")
                        Spacer()
                        TextField("000", text: $pillionFlagNumber)
                            .frame(width: 70.0, height: 0.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                Section(header: Text("App Preferences")) {
                    Toggle(isOn: $useGoogleMaps) {
                        Text("Prefer Google Maps")
                    }
                }
                
                Button(action: {
                    self.submit.toggle()
                    self.initialActiveTab = 4
                    UserDefaultsConfig.riderFlagNumber = self.riderFlagNumber
                    UserDefaultsConfig.pillionFlagNumber = self.pillionFlagNumber
                    UserDefaultsConfig.initialActiveTab = self.initialActiveTab
                    UserDefaultsConfig.useGoogleMaps = self.useGoogleMaps
                }) {
                    Text("Save Settings")
                }
                .alert(isPresented: $submit, content: {
                    Alert(title: Text("Details Saved"), message: Text("Rider: \(riderFlagNumber)"))
                })
            }

            Spacer()
            
            Button(action: { if let url = URL(string: "https://djfriar.atlassian.net/servicedesk/customer/portal/3") {
                UIApplication.shared.open(url)
                }  }) {
                    Text("App Feedback & Support").padding(.bottom,8)
            }
            Text("iTOH Version \(appVersion!).\(appBuild!)").font(.caption)
            Text("\(modelName) on iOS \(systemVersion)").font(.caption).padding(.bottom,8)
            #if DEV
            VStack {
                HStack{
                    Button(action: { Bonus.nukeData()}) {
                        Text("Nuke Bonus Data")
                            .multilineTextAlignment(.center)
                    }
                    Button(action: { Bonus.updateData()}) {
                        Text("Load Bonus Data")
                            .multilineTextAlignment(.center)
                    }
                }
                Text("Loaded \(Bonus.count()) bonuses.")
            }
            #endif
        }
        .padding(.vertical,8)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Settings().environment(\.colorScheme, .light)
            Settings().darkModeFix()
        }
    }
}
