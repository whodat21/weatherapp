//
//  WeeklyWeatherViewModel.swift
//  weatherapp
//
//  Created by admin on 23.02.2021.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var weather: WeeklyWeather?
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city: String = "London") {
        API.weeklyWeather(city) {
            self.weather = $0
        }
    }
}
