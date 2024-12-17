//
//  CalendarView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 14.12.2024.
//

import SwiftUI

struct CalendarView: View {
    var brushingDays: [BrushingDay]

    private let calendar = Calendar.current
    private let currentMonth: Date = Date()

    var body: some View {
        let daysInMonth = getDaysInMonth(for: currentMonth)
        let brushingDates = brushingDays.map { $0.date.startOfDay() }
        
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
            ForEach(daysInMonth, id: \.self) { day in
                Text("\(calendar.component(.day, from: day))")
                    .frame(width: 40, height: 40)
                    .background(brushingDates.contains(day) ? Color.green : Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .clipShape(Circle())
            }
        }
    }

    private func getDaysInMonth(for date: Date) -> [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return [] }
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date))!
        return range.compactMap { calendar.date(byAdding: .day, value: $0 - 1, to: startOfMonth) }
    }
}

extension Date {
    func startOfDay() -> Date {
        Calendar.current.startOfDay(for: self)
    }
}



