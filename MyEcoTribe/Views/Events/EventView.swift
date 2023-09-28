//
//  EventView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct EventView: View {
    
    @EnvironmentObject var liveEvent: LiveEvent
    
   
    
    var body: some View {
        
        NavigationStack {
            VStack {
                CreateButton(title: "Créer un évènement", destination: AnyView(NewEventView().environmentObject(liveEvent)))
                    .frame(height:50)
                
                //navigation view plante un peu
                ScrollView {
                    ForEach(liveEvent.liveEvent) { event in
                        let index: Int = Int.random(in : 0...users.count-1)
                        var organizer: String {
                            return users[index].profilePhoto
                        }
                        let locationDistance = Int.random(in: 10...1000)
                        
                        NavigationLink {
                            
                            EventDetailCard(eventName: event.name, eventDescription: event.description, eventLocalisation: event.localisation, eventDeadline: event.deadline, members: event.members, organizer: event.userPhoto, locationDistance: locationDistance).environmentObject(liveEvent)
                        } label: {
                            
                            EventCardView( eventName: event.name, eventDescription: event.description, eventLocalisation: event.localisation, eventDeadline: event.deadline, members: event.members,organizer: event.userPhoto, locationDistance: locationDistance, isDetailed: false ).foregroundColor(.black)
                        }
                            
                    }.padding()
                }
            }
        }.environmentObject(liveEvent)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView().environmentObject(LiveEvent())
    }
}
