//
//  MiddlePlusCar.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 21/09/2023.
//
 

import SwiftUI

struct MiddlePlusCard: View {
    
    @State var photoMiddle:String
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: 320, maxHeight: 500)
                .foregroundColor(appColorsLightGreen)
                .shadow(radius: 5)
              
            Image(photoMiddle)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(.white, lineWidth: 2))
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.top, -20)
                .padding(.leading, -20)
                .shadow(radius: 2)
                
            
        } 
    }
}

struct MiddlePlusCard_Previews: PreviewProvider {
    static var previews: some View {
        MiddlePlusCard(photoMiddle: "emilien")
    }
}
