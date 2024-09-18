//
//  TransferFundsResponse.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 13.09.2024.
//

import Foundation


struct TransferFundResponse: Decodable {
    let success: Bool
    let error: String?
}
