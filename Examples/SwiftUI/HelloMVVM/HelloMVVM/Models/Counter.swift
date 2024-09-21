//
//  Counter.swift
//  HelloMVVM
//
//  Created by Seymen Nadir Elmas on 9.09.2024.
//

import Foundation

struct Counter {
    var value :Int = 0
    var isPremium : Bool = false
    mutating func Increment() {
        value += 1
        
        if value.isMultiple(of: 3){
            isPremium = true
        }
        else {
            isPremium = false
        }
    }
}
