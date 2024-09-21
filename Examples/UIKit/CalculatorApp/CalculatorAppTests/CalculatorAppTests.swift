//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by Seymen Nadir Elmas on 21.09.2024.
//

import XCTest
@testable import CalculatorApp
class CalculatorAppTests: XCTestCase {

    
    func test_SubtractTwoNumbers() {
        
        let calculator = Calculator()
        let result = calculator.subtract(5,2)
        XCTAssertEqual(result, 3)
        
    }
    
    func test_AddTwoNumbers() {
       
        let calculator = Calculator()
        let result = calculator.add(2,3)
        
        XCTAssertEqual(result, 5)
        
    }
    
    

}
