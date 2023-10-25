//
//  BoredApp.swift
//  Bored
//
//  Created by Matteo Perotta on 17/10/23.
//

import SwiftUI
import CoreData

@main
struct BoredApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
}
