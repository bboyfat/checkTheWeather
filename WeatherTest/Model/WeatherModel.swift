//
//  WeatherModel.swift
//  WeatherTest
//
//  Created by Andrey Petrovskiy on 7/25/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct Weather: Codable{
    var main: MainData
    var name: String
    var wind: WindData
}
struct MainData: Codable {
    var humidity: Double
    var pressure: Double
    var temp: Double
}
struct WindData: Codable {
    var deg: Double
    var speed: Double
}
