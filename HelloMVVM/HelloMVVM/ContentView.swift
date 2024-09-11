//
//  ContentView.swift
//  HelloMVVM
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
            Text(counterVM.premium ? "PREMIUM" : "")
                .frame(width:200,height: 100)
                .font(.largeTitle)
                .foregroundColor(.green)
            Text("\(counterVM.value)")
                .font(.title)
            Button("increment"){
                
                self.counterVM.increment()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
