//
//  ChartView.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 23.10.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    let brushingData: [BrushingDay] = [
        BrushingDay(day: "Mon", duration: 120),
        BrushingDay(day: "Tue", duration: 110),
        BrushingDay(day: "Wed", duration: 95),
        BrushingDay(day: "Thu", duration: 130),
        BrushingDay(day: "Fri", duration: 120),
        BrushingDay(day: "Sat", duration: 100),
        BrushingDay(day: "Sun", duration: 105)
    ]

    var body: some View {
        VStack {
            Text("Haftalık Fırçalama Süresi")
                .font(.headline)
            
            Chart(brushingData) { data in
                LineMark(
                    x: .value("Gün", data.day),
                    y: .value("Süre (saniye)", data.duration)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 200)
            .padding()
        }
    }
}

struct BrushingDay : Identifiable {
   
    let id = UUID()
    let day: String
    let duration: Int
}

#Preview {
    ChartView()
}
