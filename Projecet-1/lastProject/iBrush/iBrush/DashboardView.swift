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
                        VStack{
                            Text("Bugün: \(firestoreService.dailyBrushingTime) saniye")
                                .font(.subheadline)
                            NavigationLink(destination: BrushingTimerView(firestoreService: firestoreService)) {
                                Text("+")
                                    .frame(width:10,height: 10,alignment: .bottom)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                            }
                          
                        }
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
                        .frame(height: 100)
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

                    // Fırçalama Ekle Düğmesi
           

                    // Fırçalama Geçmişi
                    VStack {
                        Text("Fırçalama Geçmişi")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 100)
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
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.mint, .cyan, .gray, .cyan, .mint]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}


#Preview {
    DashboardView()
}
