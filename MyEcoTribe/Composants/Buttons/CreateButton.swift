//
//  CreateButton.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct CreateButton: View {
    
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
             
        }).sheet(isPresented: $isPresented) {destination}
        
        
//            NavigationLink(destination: destination) {
//            ZStack {
//                 
//                    RoundedRectangle(cornerRadius: 30)
//                        .foregroundColor(appColorsGreen)
//                        .frame(width: 350, height: 40)
//                        .shadow(radius: 5)
//                Text(title)
//                    .foregroundColor(.white)
//                }
//                 
//            }
      
    }
}


struct CreateButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateButton(title: "Créer un défi", destination: AnyView(NewDefiView()))
        
    }
    
}
