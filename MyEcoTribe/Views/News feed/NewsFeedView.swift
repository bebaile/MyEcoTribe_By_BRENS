//
//  NewsFeedView.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import SwiftUI


struct NewsFeedItem: Identifiable {
    var id: UUID = UUID()
    var type: ItemType
    
    enum ItemType {
        case post(PostData)
        case tip(TipsData)
        case event(EventData)
        case defi(DefiData)
    }
}


struct CommonView: View {
    var item: NewsFeedItem
    
    let index: Int = Int.random(in : 0...users.count-1)
    var organizer: String {
        return users[index].profilePhoto
    }
    let locationDistance = Int.random(in: 10...1000)
    
    var body: some View {
        switch item.type {
        case .post(let post):
            let matchingUser: UserData = users.filter({ $0.profilePhoto == post.postAvatar }).first ?? users[1]
            
            if post.postPhoto != nil {
                return AnyView(
                    NavigationLink(destination: ProfilView(isYourProfile: false, ecogestes: ecogestes, users: matchingUser, defis: defis, events: events)) {
                        PostPhoto(post: post)
                            .foregroundColor(.black)
                            .padding(.bottom, -35)
                    }
                )
            } else {
                return AnyView(
                    NavigationLink(destination: ProfilView(isYourProfile: false, ecogestes: ecogestes, users: matchingUser, defis: defis, events: events)) {
                        PostTexte(post: post)
                            .padding(.vertical, -15)
                            .foregroundColor(.black)
                    }
                )
            }
        case .tip(let tip):
            return AnyView(TipsCard(tips: tip).font(.subheadline))
        case .event(let event):
            return AnyView(
                NavigationLink(destination: EventDetailCard(eventName: event.name, eventDescription: event.description, eventLocalisation: event.localisation, eventDeadline: event.deadline, members: event.members, organizer: organizer, locationDistance: locationDistance)) {
                    EventCardView(eventName: event.name, eventDescription: event.description, eventLocalisation: event.localisation, eventDeadline: event.deadline, members: event.members, organizer: organizer, locationDistance: locationDistance)
                        .padding(.vertical, 20)
                }
                    .foregroundColor(.black)
            )
        case .defi(let defi):
            return AnyView(
                NavigationLink(destination: DefiDetailCard(defis: defi, tips: tips.shuffled().first ?? tips[0])) {
                    DefiCard(defiData: defi)
                        .padding(.vertical, 20)
                        .foregroundColor(.black)
                }
            )
        }
    }
}


struct NewsFeedView: View {
    @EnvironmentObject var postFeed: PostFeed
    
    @State var tips: [TipsData]
    @EnvironmentObject var defis: DefiFeed
    @EnvironmentObject var events: LiveEvent
    
    @State var isPresented: Bool = false
    @State var destination:AnyView?
    
    var shuffledCards: [NewsFeedItem] {
        let postItems = postFeed.postFeed.map { NewsFeedItem(type: .post($0)) }
        let tipItems = tips.map { NewsFeedItem(type: .tip($0)) }
        let eventItems = events.liveEvent.map { NewsFeedItem(type: .event($0)) }
        let defiItems = defis.defiFeed.map { NewsFeedItem(type: .defi($0)) }
        
        let allItems: [NewsFeedItem] = postItems + tipItems + eventItems + defiItems
        return allItems.shuffled()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                ZStack {
                    HStack {
                        Text("MyEcoTribe")
                            .foregroundColor(appColorsGreen)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            .padding(.leading)
                        
                        Spacer()
                        
                    }
                }
                
                Button(action: { isPresented.toggle() }, label: {
                    HStack {
                        Text("Qu'as tu fais aujourd'hui ?")
                        Spacer()
                                       Image(systemName: "magnifyingglass")
                                   }
                                       .padding(.horizontal)
                                       .underline()
                               })  .foregroundColor(.black)
                                   .sheet(isPresented: $isPresented) { AddPostView().environmentObject(postFeed)}
                
                
                ScrollView {
                    
                    VStack(spacing: 0) {
                        ForEach(shuffledCards, id: \.id) { item in
                            CommonView(item: item)
                        }
                    }
                }
            }
        }
        .environmentObject(postFeed)
        .environmentObject(defis)
        .environmentObject(events)

    }
}


struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView(tips: [
            TipsData(description: "Éteindre les lumières lorsque vous quittez une pièce peut sembler insignifiant, mais si tout le monde le faisait, cela permettrait d'économiser une quantité considérable d'énergie au fil du temps."),
            TipsData(description: "Réparer une fuite de robinet qui goutte peut économiser jusqu'à 10 000 litres d'eau par an."),
            TipsData(description: "Opter pour le vélo ou la marche pour les courtes distances au lieu de la voiture peut réduire les émissions de CO2 et améliorer votre santé."),
            TipsData(description: "Les aliments locaux ont généralement un impact environnemental moindre en raison des distances de transport plus courtes et de la réduction des émissions de gaz à effet de serre."),
            TipsData(description: "Réduire la consommation de viande peut contribuer à réduire la déforestation et les émissions de gaz à effet de serre liées à l'industrie de la viande."),
            TipsData(description: "Plutôt que de jeter des objets usagés, envisagez de les transformer en quelque chose de nouveau et utile."),
            TipsData(description: "L'installation de panneaux solaires sur votre toit peut réduire votre dépendance aux combustibles fossiles et vous faire économiser de l'argent à long terme."),
            TipsData(description: "Le recyclage responsable des appareils électroniques, tels que les téléphones portables et les ordinateurs, contribue à réduire la pollution et à préserver les ressources."),
            TipsData(description: "Utilisez des sacs réutilisables et des contenants pour vos courses au lieu de sacs en plastique à usage unique."),
            TipsData(description: "Avant d'acheter un produit, réfléchissez à sa durabilité et à son impact sur l'environnement. Privilégiez les produits durables et fabriqués de manière responsable."),
        ]
                     
        ).environmentObject(PostFeed())
    }
}
