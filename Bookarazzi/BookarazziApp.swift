//
//  BookarazziApp.swift
//  Bookarazzi
//
//  Created by Jeandré De Villiers on 2021/09/16.
//

import SwiftUI
import Firebase

@main
struct instacloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("userId") var userId: String = ""
    
    var body: some Scene {
        WindowGroup {
            if userId.isEmpty {
            SocialFeedView()
        } else {
//            CreatePostScreenView()
            SplashView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Firebase...")
        FirebaseApp.configure()
        
        return true
    }
}
}
