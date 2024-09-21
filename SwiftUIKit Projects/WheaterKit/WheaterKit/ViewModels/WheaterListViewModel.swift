//
//  WheaterViewModel.swift
//  WheaterKit
//
//  Created by Seymen Nadir Elmas on 20.09.2024.
//

import Foundation

class WheaterListViewModel {
    
    private var wheaterViewModels = [WheaterViewModel]()
    func addWheaterViewModels(_ vm: WheaterViewModel){
        wheaterViewModels.append(vm)
    }
    func numberOfRows (_ section: Int) -> Int{
        return wheaterViewModels.count
    }
    func modelAt (_ index :Int) -> WheaterViewModel {
        return wheaterViewModels[index]
    }
    private func toCelsius() {
        
        wheaterViewModels = wheaterViewModels.map { vm in
            let wheaterModel = vm
            wheaterModel.temprature = (wheaterModel.temprature - 32) * 5/9
            return wheaterModel
        }
        
    }
    
    private func toFahrenheit() {
        
        wheaterViewModels = wheaterViewModels.map { vm in
            let wheaterModel = vm
            wheaterModel.temprature = (wheaterModel.temprature * 9/5) + 32
            return wheaterModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
            case .celsius:
                toCelsius()
            case .fahrenheit:
                toFahrenheit()
        }
    }
}
class WheaterViewModel {
    var temprature :Double
    let wheater : WeatherResponse
    init(wheater: WeatherResponse) {
        self.wheater = wheater
        temprature = wheater.main.temp
    }
    var city :String {
        return wheater.name
    }
   
}
