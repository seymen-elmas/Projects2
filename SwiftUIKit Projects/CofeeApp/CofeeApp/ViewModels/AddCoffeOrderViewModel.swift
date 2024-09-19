//
//  AddCoffeOrderViewModel.swift
//  CofeeApp
//
//  Created by Seymen Nadir Elmas on 18.09.2024.
//

import Foundation
struct AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String? 
    
    var types: [String] {
        return CoffeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeSize.allCases.map { $0.rawValue.capitalized }
    }
    
}
