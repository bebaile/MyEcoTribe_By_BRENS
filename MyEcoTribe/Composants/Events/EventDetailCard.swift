//
//  EventDetailCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct EventDetailCard: View {
    
    @State private var isJoined: Bool = false
    @State private var isDisplayed: Bool = true
    
    var eventName: String
    var eventDescription: String
    var eventLocalisation: String
    var eventDeadline: String
    var members: [String]
    var organizer: String
    var locationDistance: Int
    
    
    var body: some View {
        
        ScrollView {
        VStack {
            if isJoined {
                if isDisplayed {
                    AlertMessageEvent(isJoined: $isJoined, isDisplayed: $isDisplayed)
                }
            } else {
                //  JoinButton(title: "Rejoindre l'évènement") change rle bouton pour ne pas que la .sheet s'affiche
                CreateButton(title: "Rejoindre l'évènement", destination: AnyView(AlertMessageEvent(isJoined: $isJoined, isDisplayed: $isDisplayed))).frame(height: 40).onTapGesture {
                    isJoined = true
                }
            }
             
            
                ZStack {
                    BigCard()
                    VStack {
                        HStack {
                            Image(organizer)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                                .frame(width: 100, height: 100, alignment: .center)
                           
                        }.padding()
                        
                        VStack {
                            
                            VStack{
                                Text ("\(organizer.capitalized) t'invite à l'évènement :")
                                Text ("\(eventName)!")
                                    .fontWeight(.bold)
                            }.font(.title2)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                            ScrollView {
                                Text(eventDescription)
                                    .fontWeight(.ultraLight)
                            }.padding()
                                .multilineTextAlignment(.center)
                            
                            
                            
                        } 
                        
                        MapKITMatView(cityName: eventLocalisation)
                            .frame(width: 300,height: 150)
                            .padding()
                        HStack {
                             
                                Image(systemName: "hourglass.bottomhalf.filled")
                                Text("\(eventDeadline)\r  9h - 12h")
                                    .font(.system(size: 12))
                            Spacer()
                                Image(systemName: "mappin.and.ellipse")
                                    
                                Text("\(locationDistance) m")
                                    .font(.system(size: 12))
                         
                            Spacer()
                            PhotoStack(members: members)
                        }.padding()
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                }
            }
        }
    }
}

struct EventDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        
        EventDetailCard(eventName: "Ramassage d'ordure", eventDescription: "Je vous propose de me rejoindre pour le nettoyage des berges du Lez ce lundi 3 mars à 9h. Le nettoyage se fera en partenariat avec l'association sentinelles des rivières. Je vous propose de me rejoindre pour le nettoyage des berges du Lez ce lundi 3 mars à 9h. Le nettoyage se fera en partenariat avec l'association sentinelles des rivières", eventLocalisation: "Toulouse", eventDeadline: "21/09/2023", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"], organizer: "basile", locationDistance: 345)
    }
}

struct AlertMessageEvent: View {
    @Binding var isJoined: Bool
    @Binding var isDisplayed: Bool
    
    
    var body: some View {
        Text("Cet évènement a été ajouté à vos évènements").font(.subheadline).foregroundColor(.gray).onAppear(perform: {
            isJoined = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
                isDisplayed = false
            }
        })
        
        
    }
}
