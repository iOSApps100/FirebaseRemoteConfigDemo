//
//  FirebaseRemoteConfigDemoApp.swift
//  FirebaseRemoteConfigDemo
//
//  Created by Vikram Kumar on 07/10/26.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseRemoteConfigDemoApp: App {
    
    init() {
        // Initialezed firebase SDK.
        // In SwiftUI we did it in init() but UIKit we did that in didfinishLaunching... app delegates method.
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
