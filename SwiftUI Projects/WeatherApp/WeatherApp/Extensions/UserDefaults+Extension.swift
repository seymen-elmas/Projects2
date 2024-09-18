//
//  UserDefaults+Extension.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//

import Foundation

extension UserDefaults {
    
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .kelvin
        }
        return TemperatureUnit(rawValue: value) ?? .kelvin
    }
    
}
