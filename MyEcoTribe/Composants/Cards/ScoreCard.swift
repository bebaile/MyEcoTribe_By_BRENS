//
//  ScoreCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 22/09/2023.
//

import SwiftUI

struct ScoreCard: View {
    
    @State var symbol:String
    @State var description:String
    
    var body: some View {
        
        ZStack() {
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 350, height: 50)
                .foregroundColor(appColorsLightGreen)
                .shadow(radius: 5)
            
            HStack {
                Text(symbol)
                    .font(.system(size: 40))
                Spacer()
                Text(description)
            }.padding()
            
        }.frame(width: 350, height: 50)
            .padding(5)
    }
}

#Preview {
    ScoreCard(symbol: "♻️", description: "Tu as trié 58kg de déchets")
}
