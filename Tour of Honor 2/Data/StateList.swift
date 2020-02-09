//
//  StateList.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/9/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct StateMenu: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        return HStack {
            Spacer()
            Text(text)
                .foregroundColor(.primary)
                .font(.headline)
        }
    }
}

struct StatePicker: View {
    var menuItems = ["Texas"]
    var stateOptions = stateValues
    @Binding var showStatePicker : Bool
    
    var body: some View {
        return HStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(stateOptions) { item in
                        StateMenu(text: item.stateName)
                    }
                    Spacer()
                }
                .padding(.top, 5)
                .padding(30)
                .frame(minWidth: 0, maxWidth: 240)
                .background(Color("button"))
                .cornerRadius(15)
                .padding(.leading, 180)
                .shadow(radius: 10)
                .rotation3DEffect(Angle(degrees: showStatePicker ? 0 : 30), axis: (x: 0, y: 30, z: 0))
                .animation(.default)
                .offset(x: showStatePicker ? 0 : UIScreen.main.bounds.width)
                .onTapGesture {
                    self.showStatePicker.toggle()
                }
                Spacer()
            }
        }
        .padding(.top,80)
        //        .padding(.top, statusBarHeight)
    }
}

struct FilterByState: View {
    @Binding var showStatePicker : Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("State:").font(.callout)
                Button(action: { self.showStatePicker.toggle() }) {
                    Text("All")
                }
            }
            .padding(.trailing,8)
            .padding(.top,8)
        }
    }
}

struct RegionList : Identifiable {
    var id = UUID()
    var regionName : String
}

let regionValues = [
    RegionList(regionName: "Dakotas"),
    RegionList(regionName: "Mid-Atlantic"),
    RegionList(regionName: "New England")
]

struct StateList : Identifiable {
    var id = UUID()
    var stateName : String
}

let stateValues = [
    StateList(stateName: "Alabama"),
    StateList(stateName: "Alaska"),
    StateList(stateName: "Arizona"),
    StateList(stateName: "Arkansas"),
    StateList(stateName: "California"),
    StateList(stateName: "Colorado"),
    StateList(stateName: "Connecticut"),
    StateList(stateName: "Delaware"),
    StateList(stateName: "Florida"),
    StateList(stateName: "Georgia"),
    StateList(stateName: "Hawaii"),
    StateList(stateName: "Idaho"),
    StateList(stateName: "Illinois"),
    StateList(stateName: "Indiana"),
    StateList(stateName: "Iowa"),
    StateList(stateName: "Kansas"),
    StateList(stateName: "Kentucky"),
    StateList(stateName: "Louisiana"),
    StateList(stateName: "Maine"),
    StateList(stateName: "Maryland"),
    StateList(stateName: "Massachusetts"),
    StateList(stateName: "Michigan"),
    StateList(stateName: "Minnesota"),
    StateList(stateName: "Mississippi"),
    StateList(stateName: "Missouri"),
    StateList(stateName: "Montana"),
    StateList(stateName: "Nebraska"),
    StateList(stateName: "Nevada"),
    StateList(stateName: "New Hampshire"),
    StateList(stateName: "New Jersey"),
    StateList(stateName: "New Mexico"),
    StateList(stateName: "New York"),
    StateList(stateName: "North Carolina"),
    StateList(stateName: "North Dakota"),
    StateList(stateName: "Ohio"),
    StateList(stateName: "Oklahoma"),
    StateList(stateName: "Oregon"),
    StateList(stateName: "Pennsylvania"),
    StateList(stateName: "Rhode Island"),
    StateList(stateName: "South Carolina"),
    StateList(stateName: "South Dakota"),
    StateList(stateName: "Tennessee"),
    StateList(stateName: "Texas"),
    StateList(stateName: "Utah"),
    StateList(stateName: "Vermont"),
    StateList(stateName: "Virginia"),
    StateList(stateName: "Washington"),
    StateList(stateName: "West Virginia"),
    StateList(stateName: "Wisconsin"),
    StateList(stateName: "Wyoming")
]
