//
//  SituationView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 22/09/2023.
//

import SwiftUI

struct SituationView: View {
    var body: some View {
        
        let uniqueSections = Array(Set(situations.map { $0.section })).sorted() // Obtenez et triez les sections une fois

        NavigationView {
            ScrollViewReader { _ in
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(uniqueSections, id: \.self) { section in
                            // Utilisez ScrollView horizontale pour chaque section
                            Text(section)
                                .font(.headline)
                            
                            ScrollView(.horizontal) {
                                LazyHStack(spacing: -15) {
                                    ForEach(situations.filter { $0.section == section }) { situationInSection in
                                        SituationCard(title: situationInSection.name, symbol: situationInSection.symbol, section: situationInSection.section)
                                    }
                                }
                            } 
                        }
                        
                    }.padding()
                    
                }
                // Bouton valider de Nicolas à ajouter
                ValidateButton(title: "Valider", destination: AnyView(LandingView()))
            }
        }






    }
}

#Preview {
    SituationView()
}
