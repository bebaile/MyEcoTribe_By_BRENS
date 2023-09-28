//
//  ValidateButton.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 25/09/2023.
//

import SwiftUI

struct ValidateButton: View {
    
    @State var title: String
    @State var destination:AnyView?
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(appColorsGreen)
                    .frame(width: 350, height: 40)
                    .shadow(radius: 5)
                Text(title)
                    .foregroundColor(.white)
            }
            
        } 
           
        
        
    }
}

#Preview {
    ValidateButton(title: "Valider", destination: AnyView(NewsFeedView(tips: tips)))
}
