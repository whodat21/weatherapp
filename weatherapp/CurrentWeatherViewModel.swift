//
//  CurrentWeatherViewModel.swift
//  weatherapp
//
//  Created by admin on 23.02.2021.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel:  ObservableObject {
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch ( city: String = "london"){
        API.fetchCurrrentWeather(by: city) {
            self.current = $0
        }
    }
}
