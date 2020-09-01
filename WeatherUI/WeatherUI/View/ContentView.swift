//
//  ContentView.swift
//  WeatherUI
//
//  Created by Sai Raghu Varma Kallepalli on 28/8/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModal
    
    init() {
        self.weatherVM = WeatherViewModal()
    }
    
    var body: some View {
        VStack {
            
            Text("Welcome to the weather machine")
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .font(.system(size: 20))
            
            TextField("Enter a City name", text: self.$weatherVM.city) {
                    if !self.weatherVM.city.isEmpty {
                        self.weatherVM.searchWeather()
                    }
                }
                .foregroundColor(.white)
                .accentColor(.white)
                .frame(alignment: .center)
                .font(.system(size: 30))
                .fixedSize()
                .padding()
            
            Text(self.weatherVM.temperature)
                .foregroundColor(.white)
                .font(.system(size: 30))
        
            Text(self.weatherVM.humidity)
                .foregroundColor(.white)
                .font(.system(size: 30))
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
