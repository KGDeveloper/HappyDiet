//
//  HappyDietApp.swift
//  HappyDiet
//
//  Created by MrQi on 2024/7/11.
//

import SwiftUI

@main
struct HappyDietApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelete.self) var appDelegate
    
    var body: some Scene {
    
        WindowGroup {
            Windows()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .environmentObject(appDelegate.sharedInfo)
        }
    }
}

class AppDelete: NSObject, UIApplicationDelegate {
    
    var sharedInfo: SharedInfo = SharedInfo.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
    }
}
