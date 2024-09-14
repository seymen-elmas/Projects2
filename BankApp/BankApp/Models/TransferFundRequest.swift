//
//  TransferFundRequest.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 13.09.2024.
//

import Foundation


struct TransferFundRequest: Codable {
    
    let accountFromId: String
    let accountToId: String
    let amount: Double
    
}
