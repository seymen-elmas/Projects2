//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import Foundation

struct CreateAccountRequest: Codable {
    
    let name: String
    let accountType: String
    let balance: Double
    
}
