//
//  ContentView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct LandingView: View {
     
    var body: some View {
        
      
            NavigationView {
                
                TabView {
                    NewsFeedView(tips: tips)
                        .tabItem {
                            Label("News Feed", systemImage: "flowchart")
                        }
                    DefiView(defi: defis)
                        .tabItem {
                            Label("Défis", systemImage: "medal")
                        }
                    EventView()
                        .tabItem {
                            Label("Évènements", systemImage: "calendar")
                        }
                    ProfilView(ecogestes: ecogestes, users: users[1], defis: defis, events: events)
                        .tabItem {
                            Label("Profil", systemImage: "person")  
                        }
                } .onAppear {
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                    // correct the transparency bug for Navigation bars
                    let navigationBarAppearance = UINavigationBarAppearance()
                    navigationBarAppearance.configureWithOpaqueBackground()
                    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                }.accentColor(appColorsGreen)
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview { 
    let postFeed = PostFeed()
    let defiFeed = DefiFeed()
    let liveEvent = LiveEvent()// Créez un objet postFeed factice
           return LandingView()
               .environmentObject(postFeed)
               .environmentObject(defiFeed)
               .environmentObject(liveEvent)


}
