//
//  DashboardView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 23.11.2024.
//


import SwiftUI
import Charts

struct DashboardView: View {
    @ObservedObject var firestoreService = FirestoreService()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Kişisel Bilgiler
                VStack {
                    Text("Hoş Geldiniz!")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.cyan.opacity(0.5))
                            .frame(height: 100)
                        Text("Bu alan kişisel bilgilerinizi içerir")
                    }
                }
                .padding()
                .background(Color.indigo.opacity(0.1))
                .cornerRadius(10)

                // Başarı Grafiği
                VStack {
                    Text("Başarı Grafiği")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Chart(firestoreService.brushingDays) { day in
                        BarMark(
                            x: .value("Tarih", day.date, unit: .day),
                            y: .value("Süre (dk)", day.duration / 60)
                        )
                    }
                    .frame(height: 200)
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)

                // Rozetler ve Başarılar
                VStack {
                    Text("Rozetler")
                        .font(.headline)
                    HStack {
                        ForEach(1..<5) { index in
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 50, height: 50)
                            Text("Rozet \(index)")
                                .font(.caption)
                        }
                    }
                }
                .padding()
                .background(Color.purple.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            firestoreService.fetchBrushingData()
        }
    }
}

#Preview {
    DashboardView()
}
