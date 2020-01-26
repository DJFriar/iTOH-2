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
    @State var riderFlagNumber = ""
    @State var pillionFlagNumber = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rider Details")) {
                    HStack {
                        Text("Rider Number")
                        TextField("000", text: $riderFlagNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    HStack {
                        Text("Pillion Number")
                        TextField("000", text: $pillionFlagNumber)
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
            .navigationBarItems(
                trailing: Button(action: { self.showSettings.toggle() }) { Image(systemName: "gear") }
            )
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environment(\.colorScheme, .dark)
    }
}
