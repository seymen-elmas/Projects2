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
                VStack {
                  HStack {
                    VStack(alignment: .leading) {
                      Text("Hoşgeldin,")
                        .font(.subheadline)
                      Text(firestoreService.userName)
                        .font(.headline)
                      
                    }
                    Spacer()
                    VStack{
                      Text("Bugün")
                        .font(.subheadline)
                      Text("\(firestoreService.dailyBrushingTime) dk")
                        .font(.headline)
                      
                      
                    }
                    
                  }       //123
                  NavigationLink(destination: PersonalInfoView(firestoreService: firestoreService)) {
                    Text("Kişisel Bilgileri Düzenle")
                      .frame(width:.infinity, height:0.5)
                      .padding()
                      .background((LinearGradient(colors: [.cyan,.blue,.cyan], startPoint: .leading, endPoint: .trailing).opacity(0.5)))
                      .foregroundColor(.white)
                      .cornerRadius(10)
                  
                  
                }
            
                  .padding()
                  .background(Color.gray.opacity(0.2))
                  .cornerRadius(10)
                
                }
                
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
                
                NavigationLink(destination: AchievementsView(firestoreService: firestoreService)) {
                  Text("Tüm Rozetler")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [.green,.mint,.green], startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
                
                VStack {
                  Text("Takvim")
                    .font(.headline)
                  CalendarView(brushingDays: firestoreService.brushingDays)
                    .frame(height: 300)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
        
              }
                                 .padding()
                             }
            .navigationTitle("Ana Sayfa")
            .onAppear {
                firestoreService.fetchBrushingData()
                firestoreService.fetchUserName()
            }
         
            .background(LinearGradient(colors: [.green,.mint,.cyan,.mint], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}


#Preview {
    DashboardView()
}
