//
//  API.swift
//  weatherapp
//
//  Created by admin on 23.02.2021.
//

import SwiftUI

class API {
    class func fetchCurrrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void ){
        let query = ["q": "\(city)", "appid": appid, "units": "Imperial"]

        guard let url = baseUrlForCurrentWeather.withQueries(query) else {
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }

    // weekly weahter func
    class func weeklyWeather(_ city: String, onSuccess: @escaping (WeeklyWeather) -> Void) {
        let query = ["q": "\(city)", "appid": appid, "units": "Imperial", "cnt": "5"]
        guard baseUrlForWeeklyWeather.withQueries(query) != nil else { fatalError("Invalid URL for weekly weather")}
        guard let url = baseUrlForWeeklyWeather.withQueries(query) else { fatalError() }

        URLSession.shared.dataTask(with: url) { data, res, err in
            guard let data = data, err == nil else {
                fatalError(err!.localizedDescription)
            }

            do {
                let weather = try decoder.decode(WeeklyWeather.self, from:data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}
