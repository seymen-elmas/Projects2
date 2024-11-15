//
//  BrushingData.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 8.11.2024.
//

import Foundation

struct BrushingData: Identifiable {
    let id = UUID()
    let date: Date  // Fırçalama tarihi
    let durationInSeconds: Int // Fırçalama süresi (saniye cinsinden)
}
