//
//  PersonalinfoView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 12.12.2024.
//

import SwiftUI

struct PersonalInfoView: View {
    @ObservedObject var firestoreService: FirestoreService
    @State private var showEditUserNameView = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Kişisel Bilgiler")
                .font(.largeTitle)
                .bold()
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Ad:")
                        .font(.headline)
                    Text(firestoreService.userName)
                        .font(.body)
                    Button(action: {
                      showEditUserNameView.toggle()
                    }) {
                        Text("Düzenle")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(5)
                            .frame(width:105, height:30)
                            .background(Color.indigo.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showEditUserNameView) {
                        EditUserNameView(firestoreService: firestoreService)
                    }
                }

                HStack {
                    Text("Toplam Süre:")
                        .font(.headline)
                    Text("\(firestoreService.totalBrushingTime / 60) dk")
                        .font(.body)
                }
            }
            .padding()
            .background(Color.cyan.opacity(0.1))
            .cornerRadius(10)

            Spacer()
        }
        .onAppear {
            firestoreService.calculateTotalBrushingTime()
        }
        .padding()
    }
}



