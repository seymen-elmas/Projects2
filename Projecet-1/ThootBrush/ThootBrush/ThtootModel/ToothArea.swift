//
//  ToothArea.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import Foundation
import SwiftUI

struct ToothArea {
    var isBrushed: Bool
    var color: Color
}

struct ToothTopLeftArea: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX - 100, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.midX - 50, y: rect.minY - 50))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - 50))
        path.addLine(to: CGPoint(x: rect.midX - 100, y: rect.midY - 50))
        path.closeSubpath()
        return path
    }
}

struct ToothTopRightArea: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX + 100, y: rect.minY), control: CGPoint(x: rect.midX + 50, y: rect.minY - 50))
        path.addLine(to: CGPoint(x: rect.midX + 100, y: rect.midY - 50))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - 50))
        path.closeSubpath()
        return path
    }
}


