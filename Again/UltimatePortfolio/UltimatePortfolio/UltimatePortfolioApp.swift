//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Seymen Nadir Elmas on 26.09.2024.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
   
    @StateObject var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SideBarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        }
    }
}
