//
//  MouthView.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

struct ToothBrushView: View {
    @State private var brushPosition = 0.0 // Başlangıç konumu
        @State private var isAnimating = false
        
        var body: some View {
            ZStack {
                
                
                // Fırça şekli
                BrushShape()
                    .offset(x: calculateXPosition(), y: calculateYPosition()) // Elips hareketi
                    .rotationEffect(.degrees(brushPosition * 360)) // Fırçanın döndürülmesi
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false)) // Animasyon
                    .onAppear {
                        isAnimating = true
                        brushPosition = 1.0 // Animasyonun başlaması için hedef konum
                    }
            }
            .frame(width: 300, height: 200)
        }
        
        // Eliptik hareketin X eksenindeki konumu
        func calculateXPosition() -> CGFloat {
            let centerX: CGFloat = 1 // Elipsin merkez noktası
            let xRadius: CGFloat = 1 // X eksenindeki yarıçap
            return centerX + xRadius * cos(brushPosition * 2 * .pi) // Elips denklemi: cos ile yatay hareket
        }
        
        // Eliptik hareketin Y eksenindeki konumu
        func calculateYPosition() -> CGFloat {
            let centerY: CGFloat = 100 // Elipsin merkez noktası
            let yRadius: CGFloat = 20 // Y eksenindeki yarıçap
            return centerY + yRadius * sin(brushPosition * 2 * .pi) // Elips denklemi: sin ile dikey hareket
        }
    }

    struct BrushShape: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(width: 60, height: 20) // Fırça boyutu
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white)
                        .frame(width: 40, height: 10) // Fırça kılları
                        .offset(y: -10)
                )
        }
}

struct ToothBrushView_Previews: PreviewProvider {
    static var previews: some View {
        ToothBrushView()
    }
}


