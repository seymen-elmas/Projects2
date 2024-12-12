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
                HStack {
                  VStack(alignment: .leading) {
                    Text("Hoşgeldin,")
                      .font(.subheadline)
                    Text(firestoreService.userName)
                      .font(.headline)
                   
                      //123
                      NavigationLink(destination: PersonalInfoView(firestoreService: firestoreService)) {
                        Text("Kişisel Bilgiler")
                          .frame(width:105, height:0.5,alignment:.leading)
                          .padding()
                          .background(Color.indigo.opacity(0.5))
                          .foregroundColor(.white)
                          .cornerRadius(10)
                      
                      
                    }
                    .padding()
                
                    
                  }
                  Spacer()
                  VStack{
                    Text("Bugün")
                      .font(.subheadline)
                    Text("\(firestoreService.dailyBrushingTime) dk")
                      .font(.headline)
                    
                    NavigationLink(destination: BrushingTimerView(firestoreService: firestoreService)) {
                      Text("Süre Ekle")
                        .frame(maxWidth: .infinity)
                        .padding(5)
                        .background(Color.indigo.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width:105, height:0.5)
                        .padding()
                    }
                  }
                  
                }
                .padding()
                .background(Color.cyan.opacity(0.1))
                .cornerRadius(10)
                
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
            .navigationTitle("Dashboard")
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
