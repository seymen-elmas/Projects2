//
//  PortfolioApp.swift
//  Portfolio
//
//  Created by Seymen Nadir Elmas on 28.09.2024.
//

import SwiftUI

@main
struct PortfolioApp: App {
        @StateObject var dataController = DataController()

        var body: some Scene {
            WindowGroup {
                NavigationSplitView(sidebar: {
                    SidebarView()
                }, content: {
                    ContentView()
                }, detail: {
                    DetailView()
                })
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .environmentObject(dataController)
            }
        }
    }
