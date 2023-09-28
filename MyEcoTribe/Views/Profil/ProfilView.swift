//
//  ProfilView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI

struct ProfilView: View {
    
    @State  var profileImage: Image?

    @State var isYourProfile:Bool = true
    @State var ecogestes:[EcogesteData]
    @State var isEdited:Bool = false
    @State var isEcogesteEdited:Bool = false
    @State var taille:Double = 100
    
    @State var users:UserData
    @State var defis:[DefiData]
    @State var events:[EventData]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                HStack {
                    Spacer()
                    if isYourProfile {
                        Button(action: {
                            isEdited.toggle()
                        }, label: {
                            Text("Éditer")
                        }).sheet(isPresented: $isEdited) {EditProfileView(profilePhoto: users.profilePhoto, profileImage: $profileImage, pseudo: $users.pseudo, biography: $users.biography)}
                    }
                    
                }.padding(.trailing)
                
                VStack {
                    // HStack de profil
                    HStack {
                        if (profileImage != nil) {
                            profileImage?
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                                .shadow(radius: 2)
                                .frame(width: 110, height: 110)
                        } else {
                            Image(users.profilePhoto)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(.white, lineWidth: 2))
                                .shadow(radius: 2)
                                .frame(width: 110, height: 110)
                        }
                        Spacer()
                        VStack {
                            Text("Jeune pousse")
                                .font(.system(size: 20))
                            Text("🌱")
                                .font(.system(size: 40))
                            
                        }.multilineTextAlignment(.center)
                        Spacer()
                        
                        
                        if isYourProfile {
                            NavigationLink(destination: ScoreView(score: users.ecoScore, profilePhoto: users.profilePhoto)) { 
                                ScoreCircle(tailleCercle: $taille, score: $users.ecoScore)
                            }.foregroundColor(.black)
                        } else {
                            ScoreCircle(tailleCercle: $taille, score: $users.ecoScore)
                        }
                        
                    }.padding(.horizontal)
                }
                Divider().padding(.horizontal)
                Text(users.pseudo)
                    .font(.title)
                Text(users.biography)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Divider().padding(.horizontal)
                
                
                ScrollView {
                    HStack {
                        Text("Écogestes")
                            .font(.headline)
                        Spacer()
                        
                        if isYourProfile {
                            NavigationLink(destination: EcogestesView(ecogestes: $ecogestes)) {
                                Text("Modifier")
                            }
                        }
                    }.padding(.horizontal)
                    
                    // Partie Ecogestes
                    
                    ScrollView(.horizontal) {
                        HStack() {
                            ForEach(ecogestes.indices, id: \.self) { index in
                                if ecogestes[index].isActive == true {
                                    ProfilEcogesteCard(ecogestes: $ecogestes[index])
                                }
                            }
                        }.padding()
                    }
                    
                    // Partie défis
                    
                    HStack {
                        Text("Défis")
                            .font(.headline)
                        Spacer()
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(defis) { indexDefi in
                                ProfilDefiCard(defiData:indexDefi)
                                    .padding(.vertical)
                                    .padding(.leading)
                                
                            }
                        }
                    }
                    
                    // Partie Evenements
                    
                    HStack {
                        Text("Evènements")
                            .font(.headline)
                        Spacer()
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(events) { indexEvent in
                                ProfilEventCard(events:indexEvent)
                                    .padding(.vertical)
                                    .padding(.leading)
                            }
                            
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.horizontal)
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(ecogestes: ecogestes, users: users[1], defis: defis, events: events)
    }
}
