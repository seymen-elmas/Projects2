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
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Kullanıcı Bilgileri
                    HStack {
                        Text("Hoşgeldin, \(firestoreService.userName)")
                            .font(.headline)
                        Spacer()
                        Text("\(firestoreService.dailyBrushingTime) dk")
                            .font(.subheadline)
                            .padding(8)
                            .background(Color.cyan.opacity(0.2))
                            .cornerRadius(8)
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Başarı Grafiği
                    VStack {
                        Text("Başarı Grafiği")
                            .font(.headline)
                        Chart(firestoreService.brushingDays) { day in
                            BarMark(
                                x: .value("Tarih", day.date, unit: .day),
                                y: .value("Süre (dk)", day.duration / 60)
                            )
                        }
                        .frame(height: 150)
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Rozetler
                    VStack(alignment: .leading) {
                        Text("Kazanılan Rozetler")
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(firestoreService.achievements, id: \.self) { badge in
                                    VStack {
                                        Circle()
                                            .fill(Color.yellow)
                                            .frame(width: 50, height: 50)
                                        Text(badge)
                                            .font(.caption)
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Dashboard")
            .onAppear {
                firestoreService.fetchBrushingData()
            }
            .background(LinearGradient(
                gradient: Gradient(colors: [.mint, .cyan, .gray, .cyan, .mint]),
                startPoint: .top,
                endPoint: .bottom))
        }
    }
}

#Preview {
    DashboardView()
}
