//
//  ContentView.swift
//  Weather
//
//  Created by Abiodun Anifowose on 12/23/22.
//
import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                cityView(cityName: "Hillsboro")
                mainWeatherView(weatherImg: isNight ? "moon.stars.fill" : "cloud.sun.fill", mainTemp: 77)
                
                HStack (spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.rain.fill", temperature: 72)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "snowflake", temperature: 45)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.moon.rain.fill", temperature: 56)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.snow.fill", temperature: 79)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.heavyrain.fill", temperature: 64)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    mainButtonView(title: "Change Day/Time", fontColor: .blue, backGroundColor: .white)
                }
                
                Spacer ()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white).padding(5)
            
            Image(systemName: imageName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°").font(.system(size: 28, weight: .medium, design: .default)).foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding(5)
    }
}

struct mainWeatherView: View {
    var weatherImg: String
    var mainTemp: Int
    var body: some View {
        VStack (spacing: 10) {
            Image(systemName: weatherImg).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(mainTemp)°").font(.system(size: 70, weight: .medium, design: .default)).foregroundColor(.white)
        }
    }
}
