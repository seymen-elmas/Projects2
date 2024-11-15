//
//  Teethview.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 14.11.2024.
//

import SwiftUI

struct ToothShape: Shape {
    var size: CGSize
    var isUpper: Bool
    var position: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Diş şekli (kesici diş örneği)
        let width = size.width
        let height = size.height
        let centerX = rect.midX + position
        let centerY = rect.midY
        
        // Dişin üst kısmı (kesici)
        path.move(to: CGPoint(x: centerX - width / 2, y: centerY))
        path.addLine(to: CGPoint(x: centerX, y: isUpper ? centerY - height / 2 : centerY + height / 2))
        path.addLine(to: CGPoint(x: centerX + width / 2, y: centerY))
        path.closeSubpath()
        
        return path
    }
}

struct JawShape: Shape {
    var isUpper: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if isUpper {
            // Üst çene şekli
            path.move(to: CGPoint(x: 0, y: rect.height / 2))
            path.addCurve(to: CGPoint(x: rect.width, y: rect.height / 2), control1: CGPoint(x: rect.width / 4, y: rect.height / 4), control2: CGPoint(x: rect.width * 3 / 4, y: rect.height / 4))
        } else {
            // Alt çene şekli
            path.move(to: CGPoint(x: 0, y: rect.height / 2))
            path.addCurve(to: CGPoint(x: rect.width, y: rect.height / 2), control1: CGPoint(x: rect.width / 4, y: rect.height * 3 / 4), control2: CGPoint(x: rect.width * 3 / 4, y: rect.height * 3 / 4))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct TeethView: View {
    let toothSize = CGSize(width: 20, height: 60)
    
    var body: some View {
        VStack {
            // Üst çene şekli
            JawShape(isUpper: true)
                .fill(Color.gray.opacity(0.3))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                .frame(width: 350, height: 100)
                .padding(.top, 20)
            
            // Üst dişler
            HStack(spacing: 15) {
                ForEach(0..<6, id: \.self) { i in
                    ToothShape(size: toothSize, isUpper: true, position: CGFloat(i * 25))
                        .fill(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                }
            }
            .padding(.bottom, 10)
            
            // Alt dişler
            HStack(spacing: 15) {
                ForEach(0..<6, id: \.self) { i in
                    ToothShape(size: toothSize, isUpper: false, position: CGFloat(i * 25))
                        .fill(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                }
            }
            // Alt çene şekli
            JawShape(isUpper: false)
                .fill(Color.gray.opacity(0.3))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
                .frame(width: 350, height: 100)
            

        }
        .frame(width: 350, height: 400)
        .padding()
    }
}
#Preview {
    TeethView()
     
}
