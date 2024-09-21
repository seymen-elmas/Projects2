//
//  CounterViewModel.swift
//  HelloMVVM
//
//  Created by Seymen Nadir Elmas on 9.09.2024.
//

import Foundation
import SwiftUI

class CounterViewModel : ObservableObject {
    
    @Published private var counter :Counter = Counter()
    
    var value : Int {
        counter.value
    }
    var premium : Bool {
        counter.isPremium
    }
    func increment () {
        counter.Increment()
    }
    
}
