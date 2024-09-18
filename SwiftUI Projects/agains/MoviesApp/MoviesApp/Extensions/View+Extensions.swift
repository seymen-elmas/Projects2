//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 11.09.2024.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView()-> some View {
        return NavigationView { self }
        
    }
}
