//
//  BrushingManagerViewModel.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 8.11.2024.
//

import Foundation

class BrushingManager: ObservableObject {
    @Published var brushingData: [BrushingData] = [
        BrushingData(date: Date().addingTimeInterval(-86400 * 3), durationInSeconds: 110),
        BrushingData(date: Date().addingTimeInterval(-86400 * 2), durationInSeconds: 150),
        BrushingData(date: Date().addingTimeInterval(-86400 * 1), durationInSeconds: 180)  
    ]
    
    func addBrushingData(for date: Date, durationInSeconds: Int) {
        let newData = BrushingData(date: date, durationInSeconds: durationInSeconds)
        brushingData.append(newData)
    }
}
