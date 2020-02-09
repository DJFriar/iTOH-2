//
//  CategoryList.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/9/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct CategoryMenu: View {
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

struct CategoryPicker: View {
    var menuItems = ["Tour of Honor"]
    var categoryOptions = categoryValues
    @Binding var showCategoryPicker : Bool
    
    var body: some View {
        return HStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(categoryOptions) { item in
                        CategoryMenu(text: item.categoryName)
                    }
                    Spacer()
                }
                .padding(.top, 5)
                .padding(30)
                .frame(minWidth: 0, maxWidth: 240)
                .background(Color("button"))
                .cornerRadius(15)
                .padding(.trailing, 30)
                .shadow(radius: 10)
                .rotation3DEffect(Angle(degrees: showCategoryPicker ? 0 : 30), axis: (x: 0, y: 30, z: 0))
                .animation(.default)
                .offset(x: showCategoryPicker ? 0 : -UIScreen.main.bounds.width)
                .onTapGesture {
                    self.showCategoryPicker.toggle()
                }
                Spacer()
            }
        }
        .padding(.top,80)
//        .padding(.top, statusBarHeight)
    }
}

struct FilterByCategory: View {
    @Binding var showCategoryPicker : Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Category:").font(.callout)
                Button(action: { self.showCategoryPicker.toggle() }) {
                    Text("All")
                }
            }
            .padding(.leading,8)
            .padding(.top,8)
        }
    }
}

struct CategoryList : Identifiable {
    var id = UUID()
    var categoryName : String
}

let categoryValues = [
    CategoryList(categoryName: "Tour of Honor"),
    CategoryList(categoryName: "War Dogs (K9)"),
    CategoryList(categoryName: "Gold Star Family"),
    CategoryList(categoryName: "Huey"),
    CategoryList(categoryName: "National Parks"),
    CategoryList(categoryName: "Doughboys"),
    CategoryList(categoryName: "Madonna Trail")
]
