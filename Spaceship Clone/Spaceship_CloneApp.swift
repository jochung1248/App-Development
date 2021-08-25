//
//  Spaceship_CloneApp.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 31/7/21.
//

import SwiftUI
import Firebase

@main

struct Spaceship_CloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
 
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            LoginView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}

