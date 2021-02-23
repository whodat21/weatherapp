//
//  CardView.swift
//  weatherapp
//
//  Created by admin on 19.02.2021.
//

import SwiftUI

struct CardView: View {
    var list: ListData

    var body: some View {
        VStack{
            Text(dayOfTheWeekFromTimestamp(list.dt.timestamp))
                .font(.title)
                .foregroundColor(.white)
            HStack{
                Text("\(list.temp.day.round)º")
                Text(list.temp.min.round.toString)
                    .font(.title)
                    .foregroundColor(.white)
            }
            Text(list.weather.last?.description ?? "Unknown")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier: ViewModifier {
    var timestamp: TimeInterval

    init(_ timestamp: TimeInterval) {
        self.timestamp = timestamp
    }

    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            
    }

    private var day: String {
        return dayOfTheWeekFromTimestamp(self.timestamp)
    }
}
