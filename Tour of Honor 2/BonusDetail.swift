//
//  BonusDetail.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 12/22/19.
//  Copyright © 2019 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusDetail: View {
    var bonusName = "Something Neat"
    var bonusCode = "K9-044"
    var city = "Prosper"
    var state = "TX"
    var image = "toh_logo"
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(bonusName)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text("\(city), \(state)")
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Spacer()
        }
        .padding(30.0)
    }
}

struct BonusDetail_Previews: PreviewProvider {
    static var previews: some View {
        BonusDetail()
    }
}
