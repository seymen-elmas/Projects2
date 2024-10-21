//
//  MouthView.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

// Ağız ve damak görünümü
struct MouthAndPalateView: View {
    var body: some View {
        ZStack {
          
            
            // Alt Diş Etleri
            Path { path in
                path.move(to: CGPoint(x: 0, y: 150))
                path.addCurve(to: CGPoint(x: 300, y: 150), control1: CGPoint(x: 100, y: 120), control2: CGPoint(x: 200, y: 120))
            }
            .stroke(Color.pink, lineWidth: 8) // Alt diş etleri rengi
            
            // Üst Diş Etleri
            Path { path in
                path.move(to: CGPoint(x: 0, y: -80)) // Üst diş etleri başlangıç noktası
                path.addCurve(to: CGPoint(x: 300, y: -80), control1: CGPoint(x: 100, y: -40), control2: CGPoint(x: 200, y: -40)) // Üst diş etleri eğrisi
            }
            .stroke(Color.pink, lineWidth: 8) // Üst diş etleri rengi
            
            // Damak
            Path { path in
                path.move(to: CGPoint(x: 0, y: 100)) // Damak başlangıç noktası
                path.addCurve(to: CGPoint(x: 300, y: 100), control1: CGPoint(x: 100, y: 60), control2: CGPoint(x: 200, y: 60)) // Damak eğrisi
            }
            .stroke(Color.white, lineWidth: 4) // Damak rengi
        }
        .frame(width: 300, height: 300) // Görünüm boyutu
    }
}

struct MouthAndPalateView_Previews: PreviewProvider {
    static var previews: some View {
        MouthAndPalateView()
    }
}

