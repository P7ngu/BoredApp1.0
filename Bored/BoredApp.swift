//
//  BoredApp.swift
//  Bored
//
//  Created by Matteo Perotta on 17/10/23.
//

import SwiftUI
import SwiftData

@main
struct BoredApp: App {
    
    var container: ModelContainer
    
    init() {
        do {
            let config1 = ModelConfiguration(for: Memory.self)
           let config2 = ModelConfiguration(for: Challenge.self)
            
            container = try ModelContainer(for: Schema([Memory.self, Challenge.self]), configurations: [config1, config2])
//            container = try ModelContainer(for: Memory.self, Challenge.self, configurations: [config1, config2])
            
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
    
    
    /*
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memory.self)
                .modelContainer(for: Challenge.self)
            
        }
    */

