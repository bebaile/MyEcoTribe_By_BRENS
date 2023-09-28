//
//  EcogestesView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 21/09/2023.
//

import SwiftUI

struct EcogestesView: View {
    
    @Binding var ecogestes:[EcogesteData]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10) {
                    ForEach($ecogestes) { $indexEcogestes in
                        EcogesteCard(ecogestesCardData: $indexEcogestes, isActivated: $indexEcogestes.isActive)
                    }
                }
                .padding()
                
            }
        }
    }
}


struct EcogestesView_Previews: PreviewProvider {
    @State static var ecogestes: [EcogesteData] = [
        EcogesteData(name: "Vélo vs. voiture", symbol: "bicycle", description: "Pour une personne passant de la voiture au vélo un seul jour par semaine, la réduction de son empreinte carbone atteignait les 3,2 kg de CO2 ; cela équivaut aux émissions générées par une voiture parcourant 10 km, une portion d'agneau ou de chocolat ou l'envoi de 800 e-mails.", categorie: "Transport", isActive: false),
        EcogesteData(name: "Vélo vs. voiture", symbol: "bicycle", description: "Pour une personne passant de la voiture au vélo un seul jour par semaine, la réduction de son empreinte carbone atteignait les 3,2 kg de CO2 ; cela équivaut aux émissions générées par une voiture parcourant 10 km, une portion d'agneau ou de chocolat ou l'envoi de 800 e-mails.", categorie: "Transport", isActive: false)
    ]

    static var previews: some View {
        EcogestesView(ecogestes: $ecogestes)
    }
}
