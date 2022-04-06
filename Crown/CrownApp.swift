//
//  CrownApp.swift
//  Crown
//
//  Created by Jonathan Miller (student LM) on 2/16/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        
        FirebaseApp.configure()
        return true
    }
}

@main
struct CrownApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject var userInfo = UserInfo()
    @StateObject var competitionInfo = CompetitionInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo).environmentObject(competitionInfo)
        }
    }
}
