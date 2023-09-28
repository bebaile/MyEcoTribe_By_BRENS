//
//  ScoreView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 22/09/2023.
//

import SwiftUI

struct ScoreView: View {
    
    @State var taille:Double = 200
    @State var score:Double
    @State var profilePhoto:String
    
    var body: some View {
        VStack {
             
            HStack(spacing: 20) {
                
                VStack {
                    Text("Tribu  🌱")
                        .font(.system(size: 40))
                    Text("Jeune pousse")
                        .font(.system(size: 20))
                        .padding(.bottom, 20)
                    Text("Prochain palier : Petit bambou 🎋")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }.padding()
                 
            }
              
            ZStack {
                Image(profilePhoto)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 190, height: 190)
                    .opacity(1)
                ScoreCircle(tailleCercle: $taille, score: $score)
                    .foregroundColor(.white)
            }
            
            Spacer()
             
            ScrollView {
                ScoreCard(symbol: "♻️", description: "Tu as trié 58kg de déchets")
                ScoreCard(symbol: "🚲", description: "Tu as fait 10km de vélo")
                ScoreCard(symbol: "🌱", description: "Tu as économisé 1,2kg de papier")
                ScoreCard(symbol: "💧", description: "Tu as trié 58kg de déchets")
            }.padding()
            
        }
    }
}

#Preview {
    ScoreView(score: 88, profilePhoto: "renaud")
}
