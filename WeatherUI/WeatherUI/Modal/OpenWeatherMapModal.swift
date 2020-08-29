//
//  OpenWeatherMapModal.swift
//  WeatherUI
//
//  Created by Sai Raghu Varma Kallepalli on 29/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//



struct OpenWeatherMapResponse: Decodable {
    
    var main: Weather

}

struct Weather: Decodable {
    
    var temp:       Double?
//    let feels_like: Double
//    let temp_min:   Double
//    let temp_max:   Double
//    let pressure:   Double
    var humidity:   Double?
    
}
