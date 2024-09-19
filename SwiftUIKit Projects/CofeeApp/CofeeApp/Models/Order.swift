//
//  Order.swift
//  CofeeApp
//
//  Created by Seymen Nadir Elmas on 18.09.2024.
//

import Foundation

enum CoffeType : String , Codable,CaseIterable{
    case cappucino
    case latte
    case cortado
    case americano
    case filter
    case flat
    case esspresso
    case mocha
}
enum CoffeSize : String , Codable,CaseIterable {
    case small
    case medium
    case large
}

struct Order :Codable{
    
    let name :String
    let email : String
    let type : CoffeType
    let size : CoffeSize
    
}
