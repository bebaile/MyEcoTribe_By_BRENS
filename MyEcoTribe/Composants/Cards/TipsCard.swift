//
//  TipsCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 22/09/2023.
//

import SwiftUI

struct TipsCard: View {
    var tips: TipsData
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
                // MiddleCard(photoMiddle: "logo")
                RoundedRectangle(cornerRadius: 30)
                    .frame(maxWidth: 320, maxHeight: 200)
                    .foregroundColor(appColorsLightGreen)
                    .shadow(radius: 5)
                
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(.white, lineWidth: 2))
                    .shadow(radius: 2)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.top, -20)
                    .padding(.leading, -20)
            
                    
                VStack(spacing: 20) {
                    Text("Le savais-tu ?")
                        .font(.title2)
                    Text("ℹ️ \(tips.description)")
                        .fontWeight(.ultraLight)
                }.padding()
                    .frame(maxWidth: 320, maxHeight: 200)
                    .multilineTextAlignment(.center)
                
            }.padding()
             .frame(width: .infinity, height: .infinity)          
    }
}


struct TipsCard_Previews: PreviewProvider {
    static var previews: some View {
        TipsCard(tips: TipsData(description: "Éteindre les lumières lorsque vous quittez une pièce peut sembler insignifiant, mais si tout le monde le faisait, cela permettrait d'économiser une quantité considérable d'énergie au fil du temps."))
    }
}
