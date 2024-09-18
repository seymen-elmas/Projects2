//
//  View+Extension.swift
//  WeatherApp
//
//  Created by Seymen Nadir Elmas on 14.09.2024.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
