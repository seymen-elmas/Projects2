//
//  AchievementsView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 14.12.2024.
//

import SwiftUI

struct AchievementsView: View {
    @ObservedObject var firestoreService: FirestoreService

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Kazanılan Rozetler")
                    .font(.largeTitle)
                    .bold()

                ForEach(firestoreService.achievements, id: \.self) { badge in
                    HStack {
                        Circle()
                            .fill(Color.yellow)
                            .frame(width: 50, height: 50)
                        Text(badge)
                            .font(.headline)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}



