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
}
class WheaterViewModel {
    let wheater : WeatherResponse
    init(wheater: WeatherResponse) {
        self.wheater = wheater
    }
    var city :String {
        return wheater.name
    }
    var temprature :Double {
        return wheater.main.temp
    }
}
