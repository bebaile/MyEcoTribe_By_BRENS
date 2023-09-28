//
//  JoinButton.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 26/09/2023.
//
import SwiftUI

struct JoinButton: View {
    
    @State var title: String
    @State var isPresented: Bool = false
    @State var destination:AnyView?
    
    var body: some View {
        
       
        Button(action: {
            isPresented.toggle()
        }, label: {
            
            ZStack {
                
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(appColorsGreen)
                        .frame(width: 320, height: 40)
                        .shadow(radius: 5)
                Text(title)
                    .foregroundColor(.white)
                    
            }
             
        })
    }
}


struct JoinButton_Previews: PreviewProvider {
    static var previews: some View {
        JoinButton(title: "Créer un défi", destination: AnyView(NewDefiView()))
        
    }
    
}
