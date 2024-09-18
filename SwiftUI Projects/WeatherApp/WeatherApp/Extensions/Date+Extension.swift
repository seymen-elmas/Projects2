//
//  Date+Extension.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//

import Foundation


extension Date {
    
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
}
