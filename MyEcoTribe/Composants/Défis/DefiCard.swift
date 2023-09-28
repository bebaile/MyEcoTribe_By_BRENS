//
//  DefiCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct DefiCard: View {
    var defiData: DefiData
    var members: [String] = ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"]
    
    var body: some View {
        ZStack() {
            
            MiddleCard(photoMiddle: defiData.utilisateurPhoto)
            
            VStack {
                
                VStack(spacing: 10) {
                    Text ("\(defiData.utilisateurPhoto.capitalized) te lance un défi :")
                        .font(.footnote)
                
                Text ("\(defiData.type) !")
                    .fontWeight(.bold)
                    .font(.title2)
                
//                
//                Image(systemName: "medal")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(appColorsGreen)
                 
                Text(defiData.title)
                    .fontWeight(.ultraLight)
                }.padding()
                
                HStack {
                    Image(systemName: "hourglass.bottomhalf.filled")
                        .padding(.leading)
                    Text ("\(defiData.duration)")
                        .font(.system(size: 12))
                    Spacer()
                    Image(systemName: "mappin.and.ellipse")
                    Text (defiData.place)
                        .font(.system(size: 12))
                    Spacer()
                    PhotoStack(members: members)
                    
                }.padding()
            }
        }.padding()
            .frame(width: .infinity, height: .infinity)
        
    }
}

struct DefiCard_Previews: PreviewProvider {
    static var previews: some View {
        DefiCard(defiData: DefiData(title: "Débranche tous tes appareils", type: "Electrique", description: "Tu as 30min à partir de l'acceptation du défi pour débrancher toutes les prises de ton domicile qui ne sont pas utilisés ou pour les appareils en veille", place: "Chez toi", duration: "30 min", deadline: "03/10/2023", image: Image("debranchestesprises"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "renaud"))
    }
}
