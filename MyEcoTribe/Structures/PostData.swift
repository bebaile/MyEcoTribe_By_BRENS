//
//  PostData.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import Foundation
import SwiftUI

struct PostData: Identifiable {
    
    var id = UUID()
    var title:String // Titre du post
    var postPhoto: Image? // Photo à poster
    var postAvatar:String // Photo du posteur/postier
    var description:String // description du post
    var likesCount:Int //compteur de likes
    var sendTime: String // "Il y a"
    
}

var posts = [
    PostData(title: "Sylvain", postAvatar: "sylvain", description: "Bonjour, j'ai enfin acheté une gourde ! 😆", likesCount: 4, sendTime: "Il y a 4 min"),
    PostData(title: "Nicolas", postAvatar: "nicolas", description: "Je vais acheter un vélo cet aprem !", likesCount: 29, sendTime: "Il y a 18 min"),
    PostData(title: "Renaud", postPhoto: Image("debrancherPost"), postAvatar: "renaud", description: "J'ai débranché toutes mes prises avant de partir en vacances ! 😆", likesCount: 15, sendTime: "Il y a 37 min"),
    PostData(title: "Basile", postAvatar: "basile", description: "Il était temps de faire une nouvelle action, je lave mon linge à 30° !", likesCount: 18, sendTime: "Il y a 1 h"),
    PostData(title: "Emilien", postAvatar: "emilien", description: "J'ai enfin trouvé la déchetterie dans le 15ème !", likesCount: 32, sendTime: "Il y a 5 h"),
    PostData(title: "Sylvain", postPhoto: Image("ampoulePost"), postAvatar: "sylvain", description: "J'ai changé toutes mes ampoules en LED 💡", likesCount: 43, sendTime: "Il y a 8 h"),
]
