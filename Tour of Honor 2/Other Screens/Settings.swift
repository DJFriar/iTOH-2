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
    @State var autoDarkMode = UserDefaultsConfig.autoDarkMode
    @State var riderFlagNumber = UserDefaultsConfig.riderFlagNumber
    @State var pillionFlagNumber = UserDefaultsConfig.pillionFlagNumber
    @State var submit = false
    
    // Used for Location Tracking
    @ObservedObject var locationManager = LocationManager()
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    // Set Device Info
    let systemVersion = UIDevice.current.systemVersion
    let modelName = UIDevice.current.modelName
    
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(UIColor.label))
                Spacer()
            }
            .padding(.leading,8)
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
                        Text("Pillion Number")
                        Spacer()
                        TextField("000", text: $pillionFlagNumber)
                            .frame(width: 70.0, height: 0.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                
                Section(header: Text("App Preferences")) {
                    Toggle(isOn: $autoDarkMode) {
                        Text("Enable Automatic Dark Mode")
                    }
                    Toggle(isOn: $trophyHunter) {
                        Text("Enable Trophy Mode")
                    }
                }
                
                Button(action: {
                    self.submit.toggle()
                    UserDefaultsConfig.riderFlagNumber = self.riderFlagNumber
                    UserDefaultsConfig.pillionFlagNumber = self.pillionFlagNumber
                    UserDefaultsConfig.trophyHunter = self.trophyHunter
                    UserDefaultsConfig.autoDarkMode = self.autoDarkMode
                }) {
                    Text("Save Settings")
                        .multilineTextAlignment(.center)
                    
                }
                .alert(isPresented: $submit, content: {
                    Alert(title: Text("Details Saved"), message: Text("Rider: \(riderFlagNumber)"))
                })
            }
            HStack {
                Text("latitude: \(userLatitude)").font(.caption)
                Text("longitude: \(userLongitude)").font(.caption)
            }
            Text("Submit App Feedback").padding(.bottom,8)
            Text("iTOH Version \(appVersion!).\(appBuild!)").font(.caption)
            Text("\(modelName) on iOS \(systemVersion)").font(.caption).padding(.bottom,8)
            HStack{
                Button(action: { Bonus.nukeData()}) {
                    Text("Nuke Bonus Data")
                        .multilineTextAlignment(.center)
                }
                Button(action: { Bonus.forceLoadData()}) {
                    Text("Load Bonus Data")
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Settings().environment(\.colorScheme, .light)
            Settings().darkModeFix()
            //            Settings().previewDevice("iPhone SE")
        }
    }
}
