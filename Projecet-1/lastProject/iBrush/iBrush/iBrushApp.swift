//
//  iBrushApp.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 23.11.2024.
//

import SwiftUI
import FirebaseCore
import Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct iBrushApp: App {
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    func configureAppCheck() {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
    }
      var body: some Scene {
        WindowGroup {
          NavigationView {
            ContentView()
          }
        }
      }
}
