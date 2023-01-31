//
//  ContentView.swift
//  weatherApp
//
//  Created by Arturo Burigo on 1/31/23.
//

import SwiftUI

struct WeatherAppView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityName(cityName: "Criciúma, SC")
                MainWeatherContent(weatherImage: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 88)
                HStack (spacing: 20){
                    DayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 79
                    )
                    DayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 79
                    )
                    DayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 79
                    )
                    DayView(
                        dayOfWeek: "FRI",
                        imageName: "snowflake",
                        temperature: 79
                    )
                    DayView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.sun.bolt.fill",
                        temperature: 79
                    )
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    ChangeDayTimeButton(buttonText: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAppView()
    }
}

struct DayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 30))
            
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherContent: View {
    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName:weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
            
        }.padding(.bottom, 40)
    }
}


