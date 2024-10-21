//
//  ToothViewModel.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

class ToothViewModel: ObservableObject {
    @Published var topLeftArea: ToothArea
    @Published var topRightArea: ToothArea

    @Published var brushPosition = CGSize.zero
    @Published var currentRegion: Int = 0

    init() {
        topLeftArea = ToothArea(isBrushed: false, color: .green.opacity(0.4))
        topRightArea = ToothArea(isBrushed: false, color: .blue.opacity(0.4))
    }

    func updateBrushPosition(gesture: DragGesture.Value) {
        brushPosition = gesture.translation

        if gesture.translation.height < -100 && gesture.translation.width < -50 {
            brushTopLeftArea()
        } else if gesture.translation.height < -100 && gesture.translation.width > 50 {
            brushTopRightArea()
        
        }
    }

    func brushTopLeftArea() {
        topLeftArea.isBrushed = true
        topRightArea.isBrushed = false
       
    }

    func brushTopRightArea() {
        topLeftArea.isBrushed = false
        topRightArea.isBrushed = true
    }

    func brushBottomLeftArea() {
        topLeftArea.isBrushed = false
        topRightArea.isBrushed = false
       
    }

    func brushBottomRightArea() {
        topLeftArea.isBrushed = false
        topRightArea.isBrushed = false
       
    }

    func startAutomaticBrushing() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation {
                switch self.currentRegion {
                case 0:
                    self.brushTopLeftArea()
                    self.brushPosition = CGSize(width: 50, height: -100)
                case 1:
                    self.brushTopRightArea()
                    self.brushPosition = CGSize(width: -50, height: -100)
               
                default:
                    break
                }
                self.currentRegion = (self.currentRegion + 1) % 4
            }
        }
    }
}




