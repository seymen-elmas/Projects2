//
//  ToothBrushView2.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

import SwiftUI

struct ToothBrushView2: View {
    @State private var brushPosition = false // Hareket yönünü kontrol eden state
     
     var body: some View {
         ZStack {
             
             // Fırça şekli
             BrushShape()
                 .offset(x: brushPosition ? 100 : -100) // Fırçanın ileri geri hareketi
                 .animation(
                    Animation.easeInOut(duration: 1.75).repeatForever(autoreverses: true)
                 )
                 .onAppear {
                     brushPosition.toggle() // Hareketin başlaması
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
