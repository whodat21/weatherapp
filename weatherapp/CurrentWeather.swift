//
//  CurrentWeather.swift
//  weatherapp
//
//  Created by admin on 23.02.2021.
//

import SwiftUI

struct CurrentWeather: View  {
    var weather: Weather?

    var height: CGFloat = 0

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today in \(weather?.name ?? "Unknown")")
            .font(.title)
            .foregroundColor(.white)
            .bold()
            HStack{
                Text("\(weather?.main.temp.round ?? 0)")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(.system(size: 65))
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.body)
            Text("\(weather?.main.tempMax.round ?? 0)")
                .foregroundColor(.white)
                .font(.body)
        }.frame(width: height, height: height)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
