//
//  Dashboard2.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 18.11.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import Charts

struct Dashboard2View: View {
    @ObservedObject var firestoreService = FirestoreService()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Fırçalama Süresi ve Bölgeleri
                HStack {
                    Text("Fırçalama Süresi")
                        .font(.headline)
                    Spacer()
                    Text("Günlük: \(firestoreService.dailyBrushingTime) dk")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)

                // Hatırlatıcı
                HStack {
                    Text("Bir sonraki fırçalama için geri sayım:")
                        .font(.subheadline)
                    Spacer()
                    Text("02:30 saat")
                        .font(.headline)
                }
                .padding()
                .background(Color.green.opacity(0.1))
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
                    .frame(height: 150)
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)

                // Rozetler ve Başarılar
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

                // Fırçalama Geçmişi
                VStack(alignment: .leading) {
                    Text("Fırçalama Geçmişi")
                        .font(.headline)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 150)
                        .overlay(Text("Takvim"))
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Dashboard")
        .onAppear {
            firestoreService.fetchBrushingData()
        }
    }
}


#Preview {
    Dashboard2View()
}
