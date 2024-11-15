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
                    BrushingTimerView()
                        .frame(height:100)
                }
                .padding()
                .background(Color.cyan.opacity(0.40))
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
                .background(Color.pink.opacity(0.35))
                .cornerRadius(10)

                // Başarı Grafiği
                VStack {
                    Text("Success Process")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange.opacity(0.35))
                            .frame(height: 100)
                        ChartView()
                    }
                    
                }
                .frame(height: 100)
                .padding()
                .background(Color.yellow.opacity(0.4))
                .cornerRadius(10)
                

                // Rozetler ve Başarılar
                VStack(alignment: .leading) {
                    Text("Awards")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(1..<5) { data in
                                VStack {
                                    Circle()
                                        .fill(Color.yellow)
                                        .frame(width: 50, height: 50)
                                        .overlay(Text("\(data)").foregroundColor(.white))
                                    Text("Award \(data)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .scaleEffect(data == 1 ? 1.2 : 1.0)  // İlk ödül vurgulanmış gibi
                                .animation(.spring(), value: data)  // Basit animasyon
                            }
                        }
                    }
                }
                .padding()
                .background(Color.pink.opacity(0.35))
                .cornerRadius(10)


                // Fırçalama Geçmişi
                VStack(alignment: .leading) {
                    Text("Brushing experience")
                        .font(.headline)
                    // Takvim görünümü için basit placeholder
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.35))
                        .frame(height: 150)
                        .overlay(Text("Calendar"))
                }
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Dashboard")
       
        .background(RadialGradient(stops: [
            .init(color: Color(red: 0.1, green: 0.55, blue: 0.8), location: 0.3),
            .init(color: Color(red: 0.60, green: 1.52, blue: 2.38), location: 1.99)
        ], center: .top, startRadius: 00, endRadius: 700)
            .ignoresSafeArea()
        )
    }
}

#Preview {
    DashboardView()
}
