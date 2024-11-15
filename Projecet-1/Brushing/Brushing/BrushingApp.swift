//
//  BrushingApp.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 3.11.2024.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct BrushingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
