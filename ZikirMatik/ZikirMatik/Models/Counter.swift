//
//  Counter.swift
//  ZikirMatik
//
//  Created by Seymen Nadir Elmas on 9.09.2024.
//


import Foundation

struct Counter {
    var text = "Do you need break ? Keep deep breath and reset"
   
    var value :Int = 0
    var isPremium : Bool = false
    mutating func Increment() {
        value += 1
   
        
        if value.isMultiple(of: 30){
            isPremium = true
            
        }
        else {
            isPremium = false
        }
    }
    mutating func Reset(){
        value = 0
    }
}
