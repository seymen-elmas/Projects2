//
//  BrushingTimerView.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 23.10.2024.
//

import SwiftUI

struct BrushingTimerView: View {
    @State private var progress: CGFloat = 0.0
    let totalTime: TimeInterval = 120 // 2 dakika
    @State private var remainingTime = 120.0

    var body: some View {
        VStack {
            Text("Fırçalama Zamanlayıcı")
                .font(.headline)

            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(.blue)

                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear(duration: totalTime), value: progress)

                Text("\(Int(remainingTime)) sn")
                    .font(.title3)
                    .bold()
            }
            .frame(width: 100, height: 50)

            Button("Başla") {
                withAnimation {
                    startBrushingTimer()
                }
            }
        }
        .padding()
    }

    func startBrushingTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if remainingTime > 0 {
                remainingTime -= 1
                progress = CGFloat((totalTime - remainingTime) / totalTime)
            } else {
                timer.invalidate()
            }
        }
    }
}


#Preview {
    BrushingTimerView()
}
