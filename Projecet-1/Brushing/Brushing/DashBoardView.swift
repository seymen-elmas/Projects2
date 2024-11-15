//
//  DashBoardView.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 3.11.2024.
//

import SwiftUI

struct DashBoardView: View {
    var body: some View {
        VStack{
            VStack {
                                Text("Welcome")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                          
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.cyan.opacity(0.5))
                                        .frame(height: 100)
                                    Text("This area is personal info")
                                }
                
                                
                            }
                            .frame(height: 100)
                            .padding()
                            .background(Color.indigo.opacity(0.1))
                            .cornerRadius(10)
            
        
            VStack {
                                Text("Success Process")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                          
                                ZStack{
                                    BrushingChartView()
                                        .frame(width: 350.0, height:100.0)
                               
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.mint.opacity(0.25))
                                        .frame(height: 200)
                                
                                }
                
                                
                            }
                            .frame(height: 200)
                            .padding()
                            .background(Color.indigo.opacity(0.1))
                            .cornerRadius(10)
            VStack {
                                Text("Success Process")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                          
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.green.opacity(0.25))
                                        .frame(height: 200)
                                    VStack{
                                        HStack {
                                                    ForEach(1..<8) { day in
                                                        VStack {
                                                            Text("Day \(day)")
                                                                .font(.footnote);                            Circle()
                                                                .fill(day % 2 == 0 ? Color.green : Color.yellow)  // F
                                                                .frame(width: 15, height: 15)
                                                        }
                                                    }
                                                }
                                        .padding()
                                        HStack {
                                                    ForEach(8..<15) { day in
                                                        VStack {
                                                            Text("Day \(day)")
                                                                .font(.footnote);                            Circle()
                                                                .fill(day % 2 == 0 ? Color.green : Color.yellow)  // F
                                                                .frame(width: 15, height: 15)
                                                        }
                                                    }
                                                }
                                    }
                                }
                
                                
                            }
                            .frame(height: 200)
                            .padding()
                            .background(Color.indigo.opacity(0.1))
                            .cornerRadius(10)
            
        
        }
        
        .background(Color(red: 0.6, green: 0.90, blue: 2.85))
        
    }
}

#Preview {
    DashBoardView()
}
