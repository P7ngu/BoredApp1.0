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
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema ([
            Memory.self,
            Challenge.self
        ])
        
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }()
    
    
    var body: some Scene {
        WindowGroup {
            
            ContentView(modelContext: sharedModelContainer.mainContext)
        }
        .modelContainer(sharedModelContainer)
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

