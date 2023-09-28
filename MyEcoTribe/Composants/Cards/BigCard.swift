//
//  BigCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 21/09/2023.
//

import SwiftUI

struct BigCard: View {
     
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: 350, maxHeight: 1000)
                .foregroundColor(appColorsLightGreen)
                .shadow(radius: 5)
        
             
        }.padding()
    }
}

struct BigCard_Previews: PreviewProvider {
    static var previews: some View {
        BigCard()
    }
}
