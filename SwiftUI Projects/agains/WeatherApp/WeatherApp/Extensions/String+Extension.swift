//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
