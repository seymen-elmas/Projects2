//
//  SettingsViewModel.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 21.09.2024.
//
import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
                case .celsius:
                    return "Celcius"
                case .fahrenheit:
                    return "Fahrenheit"
            }
        }
    }
    
}

class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String, let unit = Unit(rawValue: value) {
                return unit
            }
            // Varsayılan değer olarak Celsius döndürüyoruz
            return .celsius
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}

    

