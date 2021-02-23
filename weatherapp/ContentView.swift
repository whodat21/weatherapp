//
//  ContentView.swift
//  weatherapp
//
//  Created by admin on 18.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()

    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    private var height = UIScreen.main.bounds.height

    var body: some View {
        VStack(alignment: .center, spacing: 20){

            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 0.75).animation(.easeInOut(duration: 0.5))
            }

            VStack{
                Picker("", selection: $selected){
                    Text("Today")
                        .tag(0)
                    Text("Week")
                        .tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
