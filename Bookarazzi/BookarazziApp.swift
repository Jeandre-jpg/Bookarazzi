//
//  BookarazziApp.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/16.
//

import SwiftUI
import Firebase

@main
struct BookarazziApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
   

      }

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        print("Firebase...")
        FirebaseApp.configure()
        
        return true
    }
}

