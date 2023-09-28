//
//  ProfilEcogesteCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct ProfilEcogesteCard: View {
    
    @Binding var ecogestes:EcogesteData
    
    var body: some View {
         
        NavigationLink(destination: EcogesteDetailCard(ecogestes:ecogestes, colorBase: .white)) {
            ZStack {
               
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(appColorsGreen)
                        .shadow(radius: 1)
                
                    
                Image(systemName: ecogestes.symbol)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                .frame(width: 50, height: 50)
                
        }
    }
}

struct ProfilEcogesteCard_Previews: PreviewProvider {
    @State static var ecogestes = EcogesteData(name: "Vélo vs. voiture", symbol: "bicycle", description: "Pour une personne passant de la voiture au vélo un seul jour par semaine, la réduction de son empreinte carbone atteignait les 3,2 kg de CO2 ; cela équivaut aux émissions générées par une voiture parcourant 10 km, une portion d'agneau ou de chocolat ou l'envoi de 800 e-mails.", categorie: "Transport", isActive: false)

    static var previews: some View {
        ProfilEcogesteCard(ecogestes: $ecogestes)
    }
}
