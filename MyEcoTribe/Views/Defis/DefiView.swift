//
//  DefiView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct DefiView: View {
    
    @EnvironmentObject var defiFeed: DefiFeed
    
    var defi: [DefiData]
    var members: [String] = ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                CreateButton(title: "Créer un défi", destination: AnyView(NewDefiView().environmentObject(defiFeed)))
                ScrollView {
                    ForEach (defiFeed.defiFeed) { defi in
                        NavigationLink(destination: DefiDetailCard(defis: defi, tips: tips.shuffled().first ?? tips[0]) .environmentObject(defiFeed), label:
                                        {
                            DefiCard(defiData: defi)
                                .environmentObject(defiFeed)
                                .foregroundColor(.black)
                        }
                        )}.padding()
                }
            }
        }
        .environmentObject(defiFeed)
    }
}
 
struct DefiView_Previews: PreviewProvider {
    static var previews: some View {
        DefiView (defi: [DefiData (title: "débrancher tous tes appareils", type: "Electrique", description: "Tu as 30min à partir de l'acceptation du défi pour débrancher toutes les prises de ton domicile qui ne sont pas utilisés ou pour les appareils en veille", place: "Chez toi", duration: "30", deadline: "03/10/2023", image: Image("debranchestesprises"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "sylvain")]).environmentObject(DefiFeed())
    }
}


