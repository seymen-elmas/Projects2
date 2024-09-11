//
//  ContentView.swift
//  ZikirMatik
//
//  Created by Seymen Nadir Elmas on 9.09.2024.
//

import SwiftUI

struct ContentView: View {
  
   @ObservedObject private var counterVM :CounterViewModel
    init() {
        counterVM = CounterViewModel()
    }
    var body: some View {
        VStack {
            Text(counterVM.premium ? "\(counterVM.text)" : "")
                .multilineTextAlignment(.center)
                .frame(width:300,height: 200)
                .font(.title)
                .foregroundColor(.green)
            Text("\(counterVM.value)")
                .font(.title)
            Button("i m streesing out"){
             
                self.counterVM.increment()
                
            }
            Button("Reset"){
                self.counterVM.reset()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
