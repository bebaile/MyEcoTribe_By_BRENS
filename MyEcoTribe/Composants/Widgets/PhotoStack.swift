//
//  PhotoStack.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 21/09/2023.
//

import SwiftUI

struct PhotoStack: View {
    
    var members: [String]
    
    // sélectionne un nombre au hasard de vignettes de profil à afficher
    var randomDisplayed: [String] {
        var memberDisplayed:[String] = []
        
        let numberOfMembersDisplayed = Int.random(in: 1...4)  
        for index in 0...numberOfMembersDisplayed-1 {
            memberDisplayed.append(users[index].profilePhoto)
        }
        return memberDisplayed
    }
    // on établit un tableau de couleur dans lequel on va aller chercher une couleur au hasard  pour le fond du cercle
    var circleBgColors:[Color] = [Color(red: 0.757, green: 0.951, blue: 0.787),
                                  Color(red: 0.943, green: 0.558, blue: 0.646),
                                  Color(red: 0.854, green: 0.814, blue: 0.956),
                                  Color(hue: 0.166, saturation: 0.873, brightness: 0.926)]
    
    var body: some View {
        
        HStack {
            ForEach(randomDisplayed, id: \.self) { member in
                ZStack {
                    Image(member)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(circleBgColors[Int.random(in: 0...3)], lineWidth: 2))
                }.padding(.trailing, -40)
            }
            Text("+ \(members.count-randomDisplayed.count)")
                .fontWeight(.ultraLight)
                .frame(width: 40)
                .padding(.horizontal, 20)
                .font(.caption)
        }
        
    }
}

#Preview {
    PhotoStack(members: ["members"])
}
