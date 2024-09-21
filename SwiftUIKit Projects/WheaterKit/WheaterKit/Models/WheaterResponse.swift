//
//  WheaterResponse.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 20.09.2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let name : String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
