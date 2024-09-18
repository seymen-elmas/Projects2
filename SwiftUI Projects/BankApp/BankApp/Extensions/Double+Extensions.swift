//
//  Double+Extensions.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import Foundation

extension Double {
    
    func formatAsCurrency()-> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formatterCurrency = formatter.string(from: self as NSNumber)
        
        return formatterCurrency ?? ""
    }
    
}
