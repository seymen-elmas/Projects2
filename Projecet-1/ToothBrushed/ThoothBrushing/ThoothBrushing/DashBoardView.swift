//
//  DashBoardView.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 23.10.2024.
//
import SwiftUI
struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Fırçalama Süresi ve Bölgeleri
                HStack {
                    Text("Brushing Time")
                        .font(.headline)
                    Spacer()
                    Text("Daily: 2min")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)

                // Hatırlatıcı
                HStack {
                    Text("Countdown to the next brushing:")
                        .font(.subheadline)
                    Spacer()
                    Text("02:30 Hours")
                        .font(.headline)
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)

                // Başarı Grafiği
                VStack {
                    Text("Success Process")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    // Buraya gerçek bir grafik koyabilirsin
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange.opacity(0.3))
                        .frame(height: 150)
                        .overlay(Text("Weekly Chart"))
                }
                .padding()
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)

                // Rozetler ve Başarılar
                VStack(alignment: .leading) {
                    Text("Awards")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            // Basit rozet örnekleri
                            ForEach (1..<5) { data in
                                VStack {
                                    Circle()
                                        .fill(Color.yellow)
                                        .frame(width: 50, height: 50)
                                    Text("Award \(data)")
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
                    Text("Brushing experience")
                        .font(.headline)
                    // Takvim görünümü için basit placeholder
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 150)
                        .overlay(Text("Calendar"))
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Dashboard")
    }
}

#Preview {
    DashboardView()
}
