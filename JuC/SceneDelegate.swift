//
//  SceneDelegate.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import Foundation
import UIKit
import SwiftUI
import KeyboardObserving

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView()
            .environmentObject(Keyboard()) // Add this line to provide the environment object.

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
