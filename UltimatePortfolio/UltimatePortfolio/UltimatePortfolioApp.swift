//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Seymen Nadir Elmas on 23.09.2024.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
