//
//  ChartView.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 8.11.2024.
//

import SwiftUI
import Charts

struct BrushingChartView: View {
    @ObservedObject var brushingManager = BrushingManager()
    
    var body: some View {
        VStack {
            Chart {
                // Kullanıcı verileri
                ForEach(brushingManager.brushingData) { data in
                    LineMark(
                        x: .value("Gün", data.date, unit: .day),
                        y: .value("Süre (sn)", data.durationInSeconds)
                    )
                    .symbol(Circle()) // Veri noktası
                    .interpolationMethod(.linear)
                }
                
                // Hedef süre çizgisi (2 dakika = 120 saniye)
                RuleMark(y: .value("Hedef Süre", 120))
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundStyle(.red)
                    .annotation(position: .top, alignment: .trailing) {
                        Text("Hedef: 120 sn")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
            }
            .padding()
            .frame(height: 150) // Grafik yüksekliği
            .chartXAxis {
                // Günler aşağıda, haftanın günleri formatında
                AxisMarks(values: .stride(by: .day)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.weekday(), centered: true)
                }
            }
            .chartYAxis {
                // Saniyeler solda
                AxisMarks { value in
                    AxisGridLine()
                    AxisValueLabel()
                }
            }
            
           
         
            .padding()
            .frame(width:350,height: 50,alignment: .center)
            .fixedSize()
        }
    }
}


#Preview {
    BrushingChartView()
}
