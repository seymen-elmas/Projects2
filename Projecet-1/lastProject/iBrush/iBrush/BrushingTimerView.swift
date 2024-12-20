//
//  BrushingTimerView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 23.11.2024.
//


import SwiftUI

struct BrushingTimerView: View {
    @ObservedObject var firestoreService: FirestoreService
    @State private var timeRemaining = 120
    @State private var timerRunning = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Diş Fırçalama")
                .font(.largeTitle)
                .bold()

            Text("\(timeRemaining) saniye")
                .font(.system(size: 40))
                .padding()

            HStack {
                Button(action: toggleTimer) {
                    Text(timerRunning ? "Durdur" : "Başlat")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(timerRunning ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                if timeRemaining < 120 && !timerRunning {
                    Button(action: saveBrushingTime) {
                        Text("Kaydet")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }

    private func toggleTimer() {
        timerRunning.toggle()
        if timerRunning {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer.invalidate()
                    timerRunning = false
                }
            }
        }
    }

    private func saveBrushingTime() {
        let brushingDuration = 120 - timeRemaining
        firestoreService.saveBrushingTime(duration: brushingDuration)
        timeRemaining = 120
    }
}


class MockFirestoreService: FirestoreService {
    override init() {
        super.init()
        // Önizleme için test verileri
        self.userName = "Test Kullanıcı"
        self.dailyBrushingTime = 90
        self.brushingDays = [
            BrushingDay(id: "1", date: Date(), duration: 120),
            BrushingDay(id: "2", date: Date().addingTimeInterval(-86400), duration: 80)
        ]
    }
}

#Preview {
    BrushingTimerView(firestoreService: MockFirestoreService())
}
