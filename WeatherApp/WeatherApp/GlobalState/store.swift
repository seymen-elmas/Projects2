//
//  store.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//

import Foundation

class Store: ObservableObject {
    @Published var weatherList : [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weather:WeatherViewModel){
        weatherList.append(weather)
    }
}
