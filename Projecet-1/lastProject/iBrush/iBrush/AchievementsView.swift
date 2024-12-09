//
//  AchievementsView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 9.12.2024.
//


import SwiftUI

struct AchievementsView: View {
    @ObservedObject var firestoreService: FirestoreService

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(firestoreService.achievements, id: \.self) { achievement in
                    HStack {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 50, height: 50)
                        Text(achievement)
                            .font(.headline)
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Rozetler")
    }
}
