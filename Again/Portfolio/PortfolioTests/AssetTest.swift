//
//  AssetTest.swift
//  PortfolioTests
//
//  Created by Seymen Nadir Elmas on 18.10.2024.
//

import XCTest
@testable import Portfolio

class AssetTests: XCTestCase {
    func testColorsExist() {
        let allColors = ["Dark Blue1", "Dark Gray1", "Gold1", "Gray1", "Green1", "Light Blue1", "Midnight1", "Orange1", "Pink1", "Purple1", "Red1", "Teal1"]

        for color in allColors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }
    func testAwardsLoadCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
