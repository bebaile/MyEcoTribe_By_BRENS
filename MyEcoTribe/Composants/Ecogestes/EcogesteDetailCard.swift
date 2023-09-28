//
//  EcogesteDetailCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI
import MapKit

struct EcogesteDetailCard: View {
    
    
    @State var ecogestes:EcogesteData
    @State var colorBase: Color
    
    var body: some View {
        
        ZStack {
            
            BigCard()
            
            VStack(alignment: .center) {
                
                HStack {
                    Image(systemName: ecogestes.symbol)
                        .font(.system(size: 100))
                        .padding(.top,50)
                }
                
                Text(ecogestes.name)
                    .padding()
                    .font(.title)
                    .multilineTextAlignment(.center)
                Spacer()
               
                    VStack {
                        ScrollView {
                            Text("ℹ️\r" + ecogestes.description)
                                .padding(.horizontal)
                                .fontWeight(.ultraLight)
                        .multilineTextAlignment(.center)
                        }
                        MapKITMatView(cityName: "Paris")
                            .frame(width: 300,height: 150)
                            .padding()
                }.padding()
            }.padding()
        }
    }
}

struct EcogesteDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        EcogesteDetailCard(ecogestes:EcogesteData(name: "Vélo vs. voiture", symbol: "bicycle", description: "Pour une personne passant de la voiture au vélo un seul jour par semaine, la réduction de son empreinte carbone atteignait les 3,2 kg de CO2 ; cela équivaut aux émissions générées par une voiture parcourant 10 km, une portion d'agneau ou de chocolat ou l'envoi de 800 e-mails.", categorie: "Transport", isActive: true), colorBase: appColorsLightGreen)
    }
}
