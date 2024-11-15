//
//  ChatButtonView.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 11.11.2024.
//

import SwiftUI

struct ChatButtonView: View {
    @ObservedObject var brushingManager = BrushingManager()
    var body: some View {
        Button("Bugünün Verisini Ekle") {
            brushingManager.addBrushingData(for: Date(), durationInSeconds: 130)
        }
    }
}

#Preview {
    ChatButtonView()
}
