//
//  EventCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct EventCardView: View {
    
    // let bgColor: Color = Color(red: 0.935, green: 0.945, blue: 0.928)
    @State private var isDescriptionDisplayed:Bool = false
    
    //    var profilePhoto: String // la photo de celui qui a créé l'événement
    var eventName: String
    var eventDescription: String
    var eventLocalisation: String
    var eventDeadline: String
    var members: [String]
    var organizer: String
       var locationDistance: Int 
       var isDetailed: Bool?
   
    
    var body: some View {
        ZStack{
            
            MiddlePlusCard(photoMiddle: "\(organizer)")
            
            VStack {
                
                VStack{
                    Text ("\(organizer.capitalized) t'invite à l'évènement :")
                        .font(.footnote)
                    Text ("\(eventName) !")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding(.horizontal,20)
                }.padding(.horizontal,20)
                    .multilineTextAlignment(.center)
                  
                VStack(alignment: .leading) {
                    
//                    HStack {
//                        Text("Lieu : ")
//                            .fontWeight(.bold)
//                        Text(eventLocalisation)
//                    }
//                    HStack {
//                        Text("Date : ")
//                            .fontWeight(.bold)
//                        Text(eventDeadline)
//                    }
//                    HStack {
//                        Text("Organisateur :")
//                            .fontWeight(.bold)
//                        Text(organizer.capitalized)
//                    }
                }
                
                Text(eventDescription)
                    .padding()
                    .fontWeight(.ultraLight)
                    .frame(height:100).onTapGesture {
                        isDescriptionDisplayed.toggle()
                    }.padding(.horizontal,20)
               
                MapKITMatView(cityName: eventLocalisation)
                    .frame(width: 280,height: 130)
                    .padding()
                
                HStack {
                     
                        Image(systemName: "hourglass.bottomhalf.filled")
                        Text("\(eventDeadline)\r  9h - 12h")
                            .font(.system(size: 12))
                        Image(systemName: "mappin.and.ellipse")
                            
                        Text("\(locationDistance) m")
                            .font(.system(size: 12))
                 
                    Spacer()
                    PhotoStack(members: members).padding()
                }.padding(.leading, 30)
                
               
                Text("il y a \(Int.random(in: 4...60)) min")
                    .font(.caption)
                    .padding(.leading, 200)
                    .padding(.bottom)
                    .foregroundColor(.gray)
                
              
            }.padding(.top, 20)
                .multilineTextAlignment(.center)
            
        }
        .frame(width: .infinity, height: .infinity)
            .padding()
          
    }
}


struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(eventName: "Journée de l'action écologique", eventDescription: "Je vous propose de me rejoindre pour le nettoyage des berges du Lez ce lundi 3 mars à 9h. Le nettoyage se fera en partenariat avec l'association sentinelles des rivières", eventLocalisation: "Toulouse", eventDeadline: "21/09/2023", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"],organizer: "kirsten", locationDistance: 545, isDetailed: true)
    }
}
