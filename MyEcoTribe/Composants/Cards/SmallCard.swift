//
//  SmallCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 21/09/2023.
//

import SwiftUI

struct SmallCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(maxWidth: 150, maxHeight: 150) 
            .shadow(radius: 5)
    }
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard()
    }
}
