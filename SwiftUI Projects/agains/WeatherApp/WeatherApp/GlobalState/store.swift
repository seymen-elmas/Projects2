//
//  store.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//
import Foundation

class Store: ObservableObject {
    
    @Published var selectedUnit: TemperatureUnit = .kelvin
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    init() {
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    func deleteWeather(at offsets: IndexSet) {
          weatherList.remove(atOffsets: offsets)
          
      }
    
}
