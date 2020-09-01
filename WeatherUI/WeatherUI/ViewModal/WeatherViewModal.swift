//
//  WeatherViewModal.swift
//  WeatherUI
//
//  Created by Sai Raghu Varma Kallepalli on 29/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModal: ObservableObject {
    
    private var weatherService: OpenWeatherMapWebServies
    @Published var weather: Weather
    
    private let roundingNumberFormat = "%.0f"
    
    init() {
        self.weatherService = OpenWeatherMapWebServies()
        self.weather = Weather()
    }
    
    var city: String = ""
    
    func searchWeather() {
        if let city = self.city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            getWeather(city: city )
        }
    }
    
    private func getWeather(city: String) {
        
        weatherService.getWeatherByCity(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
    
    var temperature: String {
        if let temp = weather.temp {
            return "Temperature - " + String(format: roundingNumberFormat, temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let hum = weather.humidity {
            return "Humidity - " + String(format: roundingNumberFormat, hum)
        } else {
            return ""
        }
    }
    
}
