//
//  Account.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import Foundation
enum AccountType : String ,Codable ,CaseIterable {
    case saving
    case checking
}
extension AccountType {
    var title : String {
        switch self {
        case .checking :
            return "Checking"
        case .saving :
            return "Saving"
        }
    }
}

struct Account : Codable {
    
    var id : UUID
    var name : String
    let accountType : AccountType
    var balance : Double
    
}
