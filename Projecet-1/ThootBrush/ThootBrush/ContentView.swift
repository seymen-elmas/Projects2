//
//  ContentView.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .frame(width: 400,height: 450)
            
            Rectangle()
                .clipShape(.buttonBorder)
                .foregroundStyle(.white)
                .frame(width: 400,height: 450)
                
            VStack(){
                BrushingToothView()
                    .rotationEffect(.degrees(180))
                    .padding(50)
                BrushingToothView2()
                    .rotationEffect(.degrees(0))
                    
                
                
            }
            ToothBrushView()
                .rotationEffect(.degrees(180))
                
           
            ToothBrushView()
                .rotationEffect(.degrees(0))
                
            ToothBrushView2()
                .rotationEffect(.degrees(180))
            
           
    
        }
     
       
    }
}

#Preview {
    ContentView()
}
