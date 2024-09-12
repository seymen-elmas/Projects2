//
//  View+Extensions.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
    
}
