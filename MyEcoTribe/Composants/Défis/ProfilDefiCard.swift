//
//  ProfilDefiCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct ProfilDefiCard: View {
    var defiData : DefiData
    var body: some View {
            ZStack {
              
                SmallCard()
                    .foregroundColor(appColorsLightGreen)
                
                VStack {
                    
                    
                    HStack (spacing: 10) {
                        Image (defiData.utilisateurPhoto)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(.white, lineWidth: 2))
                            .shadow(radius: 2)
                            .frame(width: 40, height: 40, alignment: .center)
            
                        Text ("🆚")

                        Image ("emilien")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle()
                                .stroke(.white, lineWidth: 2))
                            .shadow(radius: 2)
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    
                    Text (defiData.type)
                        .fontWeight(.bold)
                    Text ("+ 1 ♻️")
                     
                    Text ("Terminé le \(defiData.computedDate.formatted())")
                        .fontWeight(.ultraLight)
                        .font(.system(size: 8))
                        .padding(.top)
                }
            }
            .frame(width: 150.0, height: 150.0)
        }
}

struct ProfilDefiCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfilDefiCard(defiData: DefiData(title: "débrancher tous tes appareils", type: "Electrique", description: "Tu as 30min à partir de l'acceptation du défi pour débrancher toutes les prises de ton domicile qui ne sont pas utilisés ou pour les appareils en veille", place: "Chez toi", duration: "30", deadline: "03/10/2023", image: Image("debranchestesprises"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "basile"))
    }
}
