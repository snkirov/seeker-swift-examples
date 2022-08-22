//
//  SeekerSwiftUIExampleApp.swift
//  SeekerSwiftUIExample
//
//  Created by Svilen Kirov on 18.07.22.
//

import SwiftUI
import Seeker
import Default_Configuration

@main
struct SeekerApp: App {
    
    init() {
        // Default Configration Setup
        Seeker.setupDefaultConfiguration(host: "localhost")
        
        // Equivalent to:
//        Seeker.setupLoggingELKLogger(hostname: "localhost")
//        Seeker.setupSwiftPrometheusMetrics(hostname: "localhost")
//        Seeker.setupOpenTelemetryTracer(hostname: "localhost")
        
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

