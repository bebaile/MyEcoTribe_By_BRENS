//
//  SituationCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct SituationCard: View {
    
    @State var title: String
    @State var symbol: String
    @State var section: String
    @State var isActivated:Bool = false
    
    var body: some View {
        
        Button {
            isActivated.toggle()
        } label: {
            
            ZStack {
                SmallCard().foregroundColor(isActivated ? appColorsGreen :  appColorsLightGreen)
                
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: symbol)
                            .font(.system(size: 25))
                            .padding(.top, 10)
                    }
                    HStack {
                        Text(title)
                            .font(.system(size: 15))
                    } 
                }
            }.frame(width: 100, height: 100)
        }.foregroundColor(isActivated ? appColorsLightGreen : .black)
            .padding()
    }
}

struct SituationCard_Previews: PreviewProvider {
    static var previews: some View {
        SituationCard(title: "Ville", symbol: "building.fill", section: "Habitation")
    }
}
