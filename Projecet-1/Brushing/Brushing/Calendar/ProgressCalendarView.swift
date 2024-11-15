//
//  ProgressCalendarView.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 15.11.2024.
//


import SwiftUI

struct ProgressCalendarView: View {
    var body: some View {
        VStack {
            Text("Brushing Progress")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green.opacity(0.3))
                .frame(height: 200)
                .overlay(Text("Calendar Placeholder"))
        }
        .padding()
    }
}

#Preview {
    ProgressCalendarView()
}
