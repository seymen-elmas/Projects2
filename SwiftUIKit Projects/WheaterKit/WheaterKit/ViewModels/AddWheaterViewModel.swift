//
//  AddWheaterViewModel.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 20.09.2024.
//

import Foundation

class AddWheaterViewModel {
    func addWheater(for city:String,completion:@escaping (WheaterViewModel)-> Void){
        let wheaterUrl = Constants.Urls.urlForWeatherByCity(city: city)
        let wheaterResource = Resource<WeatherResponse> (url: wheaterUrl) { data in
            let wheaterResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return wheaterResponse
        }
        Webservice().load(resource: wheaterResource) { (result) in
            if let weatherResource = result {
                let vm = WheaterViewModel(wheater: weatherResource)
                completion(vm)
            }
        }
    }
}
