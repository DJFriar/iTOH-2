//
//  Settings.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var showSettings = false
    @State var leftyMode = false
    @State var trophyHunter = false
    @State var autoDarkMode = true
    @State var riderFlagNumber = ""
    @State var pillionFlagNumber = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rider Details")) {
                    HStack {
                        Text("Rider Number")
                        Spacer()
                        TextField("000", text: $riderFlagNumber)
                            .frame(width: 70.0, height: 0.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    HStack {
                        Text("Pillion Number")
                        Spacer()
                        TextField("000", text: $pillionFlagNumber)
                            .frame(width: 70.0, height: 0.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                Section(header: Text("App Preferences")) {
                    Toggle(isOn: $leftyMode) {
                        Text("Right Hand Layout")
                    }
                    Toggle(isOn: $trophyHunter) {
                        Text("Enable Trophy Mode")
                    }
                    Toggle(isOn: $autoDarkMode) {
                        Text("Enable Automatic Dark Mode")
                    }
                }
                
                Button(action: { self.submit.toggle() }) {
                    Text("Save Settings")
                        .multilineTextAlignment(.center)
                }
                .alert(isPresented: $submit, content: {
                    Alert(title: Text("Details Saved"), message: Text("Rider: \(riderFlagNumber)"))
                })
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Settings().environment(\.colorScheme, .dark)
            Settings().environment(\.colorScheme, .light)
        }
    }
}
