//
//  NavOverlay.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

let statusBarHeight = UIApplication.shared.statusBarFrame.height
let screen = UIScreen.main.bounds

struct NavOverlay: View {
    @State var show = false
    @State var showMenu = false
    @State var showBonuses = false
    @State var showSettings = false
    
    var body: some View {
        
        ZStack {
            
            MenuCircle(showMenu: $showMenu)
                .offset(x: -80, y: showBonuses ? statusBarHeight : 25)
                .animation(.spring())
            
            MenuButton(show: $showMenu)
                .offset(x: -40, y: showBonuses ? statusBarHeight : 80)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    var body: some View {
        return VStack {
            HStack {
                Button(action: { self.show.toggle() }) {
                    HStack {
                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing, 18)
                    .frame(width: 90, height: 60)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MenuCircle: View {
    @Binding var showMenu : Bool
    var body: some View {
        return VStack {
            HStack {
                Button(action: { self.showMenu.toggle() }) {
                    HStack {
                        //                        Spacer()
                        Image(systemName: "list.dash")
                            .foregroundColor(Color.red)
                    }
                        
                    .frame(width: 180.0, height: 180.0, alignment: .center)
                    .background(showMenu ? Color.black : Color.white)
                    .foregroundColor(Color.white)
                    .cornerRadius(90)
                    
                    //        Text("Test")
                    //            .padding(.trailing, 18)
                    //            .offset(x: -40, y: showBonuses ? statusBarHeight : 80)
                }
                Spacer()
            }
            Spacer()
        }
        .onTapGesture {
            self.showMenu.toggle()
        }
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title : String
    var icon : String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Bonuses", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down"),
    Menu(title: "Settings", icon: "gear")
]

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            Text(text)
                .foregroundColor(.primary)
                .font(.headline)
            Spacer()
        }
    }
}

struct MenuView: View {
    var menuItems = ["My Account","Bonuses","Team","Sign Out","Settings"]
    var menu = menuData
    @Binding var show : Bool
    @State var showSettings = false
    @State var showBonuses = false
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(menu) { item in
                    if item.title == "Settings" {
                        Button(action: { self.showSettings.toggle() }) {
                            MenuRow(image: item.icon, text: item.title)
                                .sheet(isPresented: self.$showSettings) { Settings() }
                        }
                    } else if item.title == "Bonuses" {
                        Button(action: { self.showBonuses.toggle() }) {
                            MenuRow(image: item.icon, text: item.title)
                                .sheet(isPresented: self.$showBonuses) { BonusList() }
                        }
                    }
                    
                    else {
                        MenuRow(image: item.icon, text: item.title)
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}


struct NavOverlay_Previews: PreviewProvider {
    static var previews: some View {
        NavOverlay()
    }
}


