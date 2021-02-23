//
//  WeeklyWeatherViewModel.swift
//  weatherapp
//
//  Created by admin on 19.02.2021.
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
    func fetch(by city: String = "new york") {
        API.weeklyWeather(city) {
            self.weather = $0
        }
    }
}
