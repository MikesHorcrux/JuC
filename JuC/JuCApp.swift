//
//  JuCApp.swift
//  JuC
//
//  Created by Mike on 2/25/23.
//

import SwiftUI
import FirebaseCore
import KeyboardObserving

@main
struct JuCApp: App {
    
    @StateObject private var authManager = AuthenticationManager.shared
    @StateObject private var keyboardState = KeyboardState()
    
    init() {
        FirebaseApp.configure()
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
                    .environmentObject(keyboardState)
            }
        }
    }
}
