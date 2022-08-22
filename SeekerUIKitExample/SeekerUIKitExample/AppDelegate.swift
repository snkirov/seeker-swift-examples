//
//  AppDelegate.swift
//  SeekerUIKitExample
//
//  Created by Svilen Kirov on 18.07.22.
//

import UIKit
import Seeker
import Default_Configuration

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup the Default Configuration
        Seeker.setupDefaultConfiguration(host: "localhost")
        
        // Equivalent to:
//        Seeker.setupLoggingELKLogger(hostname: "localhost")
//        Seeker.setupSwiftPrometheusMetrics(hostname: "localhost")
//        Seeker.setupOpenTelemetryTracer(hostname: "localhost")
        
        Seeker.logger.info("App Started!")
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

