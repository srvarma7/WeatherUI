//
//  OpenWeatherMapWebServices.swift
//  WeatherUI
//
//  Created by Sai Raghu Varma Kallepalli on 29/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import Foundation
import Combine

class OpenWeatherMapWebServies {
    
    func getWeatherByCity(city: String, completion: @escaping (Weather?) -> () ) {
        
        let api_URL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_Key)")!
        
        URLSession.shared.dataTask(with: api_URL) { (data, response, error) in
            guard let data = data, error == nil else {
                debugPrint("⛔️ -> Error occured while fetching the data from API")
                completion(nil)
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(OpenWeatherMapResponse.self, from: data)
                print("✅ -> Weather data fetching successful for \(city)")
                let parsedWeather = weather.main
                completion(parsedWeather)
                return
                
            } catch {
                debugPrint("⛔️ -> Error occured while pasrsing the fetched data")
                completion(nil)
                return
            }
        }.resume()
        
    }
    
}
