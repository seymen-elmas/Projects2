//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
