//
//  UltimatePortfolioTests.swift
//  UltimatePortfolioTests
//
//  Created by Seymen Nadir Elmas on 7.10.2024.
//

import CoreData
import XCTest
@testable import UltimatePortfolio

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!
    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
