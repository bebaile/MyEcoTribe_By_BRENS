//
//  MyEcoTribeApp.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

@main
struct MyEcoTribeApp: App {
    
    @StateObject var postFeed = PostFeed()
    @StateObject var liveEvent = LiveEvent()
    @StateObject var defiFeed = DefiFeed()

    
    var body: some Scene {
        WindowGroup {
           // LandingView()
            LoginView(userData: users[1])
             .environmentObject(postFeed)
             .environmentObject(liveEvent)
             .environmentObject(defiFeed)
        }
    }
}
