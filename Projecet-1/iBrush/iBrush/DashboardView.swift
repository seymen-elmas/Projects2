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
        ZStack{
            ScrollView {
                VStack(spacing: 20) {
                    // Kullanıcı Bilgileri
                    HStack {
                        Text("Hoşgeldin, \(firestoreService.userName)")
                            .font(.headline)
                        Spacer()
                    }
                    .padding()
                    .background(Color.cyan.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Fırçalama Süresi
                    HStack {
                        Text("Bugün Fırçalama Süresi")
                            .font(.headline)
                        Spacer()
                        Text("\(firestoreService.dailyBrushingTime) dk")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
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
                    
                    // Fırçalama Geçmişi
                    VStack {
                        Text("Fırçalama Geçmişi")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
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
            .background( LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 162 / 255, green: 210 / 255, blue: 255 / 255),
                    Color(red: 189 / 255, green: 224 / 255, blue: 254 / 255),
                    Color(red: 255 / 255, green: 175 / 255, blue: 204 / 255),
                    Color(red: 255 / 255, green: 200 / 255, blue: 221 / 255),
                    Color(red: 205 / 255, green: 180 / 255, blue: 219 / 255)
                ]),
                startPoint: .top,
                endPoint: .bottom) )
        }
    }
}


#Preview {
    DashboardView()
}
