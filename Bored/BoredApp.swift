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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memory.self)
            
        }
    }
}
