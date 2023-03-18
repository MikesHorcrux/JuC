//
//  JuCApp.swift
//  JuC
//
//  Created by Mike on 2/25/23.
//

import SwiftUI
import FirebaseCore

@main
struct JuCApp: App {
    
    @StateObject private var authManager = AuthenticationManager.shared
    
    init() {
        FirebaseApp.configure()
    }
    
    @ViewBuilder
    var body: some Scene {
        WindowGroup {
//            if authManager.user != nil {
//                AuthView()
//                    .preferredColorScheme(.dark)
//                    .environmentObject(authManager)             } else {
                ContentView()
                    .environmentObject(authManager) 
            //}
        }
    }
}
