//
//  ToothBrushView2.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

import SwiftUI

struct ToothBrushView2: View {
    @State private var brushPosition = 0.0 // Başlangıç konumu
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Diş Etleri ve Dişler
            Path { path in
                path.move(to: CGPoint(x: 50, y: -150))
                path.addCurve(to: CGPoint(x: 250, y: -150), control1: CGPoint(x: 100, y: -100), control2: CGPoint(x: 200, y: -100)) // Diş eğrisi
            }
            .stroke(Color.gray, lineWidth: 3)
            
            // Fırça şekli
            BrushShape()
                .offset(x: CGFloat(brushPosition * -100), y: CGFloat(brushPosition * 30)) // Yarım daire hareketi
                .rotationEffect(.degrees(brushPosition * 180)) // Fırçanın döndürülmesi
                .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) // Animasyon
                .onAppear {
                    isAnimating = true
                    brushPosition = 1.0 // Animasyonun başlaması için hedef konum
                }
        }
        .frame(width: 300, height: 200)
    }
}

struct BrushShape2: View {
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

struct ToothBrushView2_Previews: PreviewProvider {
    static var previews: some View {
        ToothBrushView2()
    }
}
