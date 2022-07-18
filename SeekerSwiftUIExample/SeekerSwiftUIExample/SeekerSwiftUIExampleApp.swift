//
//  SeekerSwiftUIExampleApp.swift
//  SeekerSwiftUIExample
//
//  Created by Svilen Kirov on 18.07.22.
//

import SwiftUI
import Seeker

@main
struct SeekerApp: App {
    
    init() {
        // Logger Setup
        Seeker.loggerSetup()
        
        // Tracer Setup
        Seeker.tracerSetup()
        
        // Metrics Setup
        Seeker.metricsSetup()
        
        Seeker.logger.info("App Started!")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}

