//
//  Weather.swift
//  weatherapp
//
//  Created by admin on 21.02.2021.
//

import SwiftUI

struct Model: Codable {
    var weather: [Weather]
    var main: Main
    var sys: Sys
    var wind: Wind
    var name: String
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct Wind: Codable {
    var speed: Double
    var deg: Int
}

struct Sys: Codable {
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct UserInput: Codable {
    var userCityInput: String
}
