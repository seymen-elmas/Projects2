//
//  ContentView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 23.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("TBT3")
                .resizable()
                .opacity(0.4)
            VStack{
                Image("TBT3")
                    .resizable()
                    .frame(width:200,height: 200)
                Text("i-BRUSH")
                    .font(.largeTitle)
                    .bold()
                LoginView()
            }
           
        }
        .background(LinearGradient(colors: [.mint,.cyan,.mint], startPoint: .top, endPoint: .bottom))
        
        
    }
}
#Preview {
    ContentView()
}
