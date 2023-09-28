//
//  ProfilEventCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct ProfilEventCard : View {
    
    var events : EventData
    
    var body: some View {
        
        ZStack() {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(maxWidth: 200, maxHeight: 150)
                .shadow(radius: 5)
                .foregroundColor(appColorsLightGreen)
            
            
            HStack {
                VStack {
                    
                    HStack( ) {
                        Image(events.userPhoto)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(.white, lineWidth: 2))
                            .shadow(radius: 2)
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(Color.black)
                            .font(.title2)
                        Spacer()
                        PhotoStack(members: events.members)
                    }.padding(.horizontal)
                    
                    Text (events.name).padding(.horizontal)
                    
                    Text ("+ 15 ♻️")
                     
                    
                    Text ("Terminé le \((events.computedDate-6).formatted())")
                        .fontWeight(.ultraLight)
                        .font(.system(size: 8))
                        .padding(.top)
                    
                }
               
                
            }.frame(width: 200, height: 150)
        }
    }
}


struct ProfilEventCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfilEventCard(events: EventData(name: "Ramassage d'ordures", description: "Je vous propose de me rejoindre pour le nettoyage des berges du Lez ce lundi 3 mars à 9h. Le nettoyage se fera en partenariat avec l'association sentinelles des rivières", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne"], numberOfMembers: 17.0, duration: "60 min", deadline: "03/03/23", localisation: "Montpellier", userPhoto: "renaud"))
    }
}
