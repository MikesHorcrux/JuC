//
//  JuCApp.swift
//  JuC
//
//  Created by Mike on 2/25/23.
//

import SwiftUI
import FirebaseCore
import KeyboardObserving
import Sentry

@main
struct JuCApp: App {
    
    @StateObject private var authManager = AuthenticationManager.shared
    
    init() {
        FirebaseApp.configure()
        
        SentrySDK.start { options in
            options.dsn = "https://28b0a37535c74edf9ed4850daee65897@o1189287.ingest.sentry.io/4504952708726784"
            options.debug = true // Enabled debug when first installing is always helpful
            
            // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
            // We recommend adjusting this value in production.
            options.tracesSampleRate = 1.0
            
        }
    }
        
        @ViewBuilder
        var body: some Scene {
            WindowGroup {
                if authManager.user == nil {
                    AuthView()
                        .environmentObject(authManager)
                    //.environmentObject(Keyboard()) // Add the Keyboard environment object here.
                } else {
                    ContentView()
                        .environmentObject(authManager)
                        .environmentObject(Keyboard()) // Add the Keyboard environment object here.
                }
            }
        }
    }
