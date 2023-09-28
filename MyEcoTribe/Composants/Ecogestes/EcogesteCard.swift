//
//  EcogesteCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct EcogesteCard: View {
    
    @Binding var ecogestesCardData:EcogesteData
    @Binding var isActivated:Bool

    
    var body: some View {
         
        Button {
            isActivated.toggle()
        } label: {
            
            ZStack {
                SmallCard().foregroundColor(isActivated ? appColorsGreen :  appColorsLightGreen)
                
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: ecogestesCardData.symbol)
                            .font(.system(size: 35))
                            .padding(.leading, 10) // Déplace l'icône de vélo à gauche
                            .padding(.top, 5) // Décale de 10 points vers le bas
                        
                        Spacer()
                        ZStack(alignment: .topTrailing) {
                              
                            NavigationLink(destination: EcogesteDetailCard(ecogestes:ecogestesCardData, colorBase: appColorsLightGreen)) {
                                
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 25))
                                    .padding(.top, 5)
                                    .padding(.trailing, 10)
                                    .foregroundColor(isActivated ? .white : .black)
                            }.navigationTitle("Écogestes")
                        }
                    } 
                    HStack {
                        Text(ecogestesCardData.name)
                            .font(.system(size: 14))
                        .padding()
                    }
                    Spacer()
                }
            }.frame(width: 150, height: 150) 
        }.foregroundColor(isActivated ? appColorsLightGreen : .black)
            .padding()
        
    }
}




struct EcogesteCard_Previews: PreviewProvider {
    @State static var ecogestes: [EcogesteData] = [EcogesteData(name: "Vélo vs. voiture", symbol: "bicycle", description: "Description", categorie: "Categorie", isActive: false)]

       static var previews: some View {
           EcogesteCard(ecogestesCardData: $ecogestes[0], isActivated: .constant(false))
       }
}
//struct EcogesteCard_Previews: PreviewProvider {
//     
//    static var previews: some View {
//        
//        EcogesteCard(ecogestes:ecogestes)
//    }
//}
