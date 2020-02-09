//
//  BonusDataArray.swift
//  Tour of Honor 2
//
//  Created by Tommy Craft on 2/9/20.
//  Copyright © 2020 Tommy Craft. All rights reserved.
//

import SwiftUI

struct BonusData: Identifiable {
    var id = UUID()
    var sampleImage: String
    var bonusName: String
    var bonusCode: String
    var bonusCategory: String
    var city: String
    var state: String
}

let sampleBonusData = [
    BonusData(sampleImage: "2019tx6",
              bonusName: "Something in Texas",
              bonusCode: "TX6",
              bonusCategory: "Tour of Honor",
              city: "Texarkana",
              state: "TX"),
    BonusData(sampleImage: "2019ca1",
              bonusName: "Something in California",
              bonusCode: "CA1",
              bonusCategory: "Tour of Honor",
              city: "Lompoc",
              state: "CA"),
    BonusData(sampleImage: "2019ma3",
              bonusName: "Something in Massachusetts",
              bonusCode: "MA3",
              bonusCategory: "K9",
              city: "Walther",
              state: "MA"),
    BonusData(sampleImage: "2019tx5",
              bonusName: "Something else in Texas",
              bonusCode: "TX5",
              bonusCategory: "Tour of Honor",
              city: "Pecos",
              state: "TX"),
    BonusData(sampleImage: "2019ca5",
              bonusName: "Something else in California",
              bonusCode: "CA5",
              bonusCategory: "Huey",
              city: "San Diego",
              state: "CA"),
    BonusData(sampleImage: "2019nv4",
              bonusName: "Something in Nevada",
              bonusCode: "NV4",
              bonusCategory: "Tour of Honor",
              city: "Reno",
              state: "NV"),
    BonusData(sampleImage: "2019fl7",
              bonusName: "Something in Florida",
              bonusCode: "FL7",
              bonusCategory: "Gold Medal Family",
              city: "St. Augustine",
              state: "FL")
]
