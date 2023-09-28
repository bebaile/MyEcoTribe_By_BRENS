//
//  DefiDetailCard.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct DefiDetailCard: View {
    
    @State private var isJoined: Bool = false
    @State private var isDisplayed: Bool = true
    
    var defis:DefiData
    var tips:TipsData
    
    var body: some View {
        
        
        ScrollView {
            VStack {
                
                if isJoined {
                    if isDisplayed {
                        AlertMessageDefi(isJoined: $isJoined, isDisplayed: $isDisplayed)
                    }
                } else {
                    //  JoinButton(title: "Rejoindre l'évènement") change rle bouton pour ne pas que la .sheet s'affiche
                    CreateButton(title: "Accepter le défi", destination: AnyView(AlertMessageDefi(isJoined: $isJoined, isDisplayed: $isDisplayed))).frame(height: 40).onTapGesture {
                        isJoined = true
                    }
                }
                
                ZStack() {
                    
                    BigCard()
                     
                    VStack {
                         
                        HStack {
                          
                            Image(defis.utilisateurPhoto)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                                .frame(width: 100, height: 100, alignment: .center) 
                             
                        }.padding()
                        
                        VStack{
                            Text ("\(defis.utilisateurPhoto.capitalized) te lance un défi :")
                            Text ("\(defis.type) !")
                                .fontWeight(.bold)
                        }.font(.title2)
                            .padding()
                            .multilineTextAlignment(.center)
                      
                        ScrollView {
                            VStack {
                                
                                Text(defis.title)
                                    .underline()
                               Spacer()
                                Text ("👉 \(defis.description)")
                                    .fontWeight(.ultraLight)
                                Spacer()
                                Text ("📷 Penses a partager ton défi")
                                Spacer()
                                Text("ℹ️ \(tips.description)")
                                    .fontWeight(.ultraLight)
                                
                            }.padding()
                        }
                        
                        
                        HStack {
                            Image(systemName: "hourglass.bottomhalf.filled")
                            Text (defis.duration)
                                Spacer()
                            Image(systemName: "mappin.and.ellipse")
                            Text (defis.place)
                           Spacer()
                            PhotoStack(members: defis.members)
                        }.padding()
                    }
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                }
            }
        }
       
    }
}

struct DefiDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DefiDetailCard (defis: DefiData(title: "Débranches tous tes appareils", type: "Electrique", description: "Tu as 30min à partir de l'acceptation du défi pour débrancher toutes les prises de ton domicile qui ne sont pas utilisés ou pour les appareils en veille.", place: "Chez toi", duration: "30min", deadline: "03/10/2023", image: Image("debranchestesprises"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "renaud"),  tips : TipsData(description: "Un réacteur nucléaire doit fonctionner sans interruption pour assurer la consommation cachée des appareils électriques en veille en France. L’ADEME informe que cette consommation représenterait 11% de la consommation électrique moyenne annuelle de chaque foyer français."))
    }
}

 
struct AlertMessageDefi: View {
    @Binding var isJoined: Bool
    @Binding var isDisplayed: Bool
    
    
    var body: some View {
        Text("Ce défi à été ajouté à votre profil").font(.subheadline).foregroundColor(.gray).onAppear(perform: {
            isJoined = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
                isDisplayed = false
            }
        })
        
        
    }
}
