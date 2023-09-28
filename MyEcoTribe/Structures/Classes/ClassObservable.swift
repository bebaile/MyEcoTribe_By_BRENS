//
//  ClassObservable.swift
//  MyEcoTribe
//
//  Created by Sylvain Leguay on 25/09/2023.
//

import Foundation
import SwiftUI

class PostFeed: ObservableObject {
    @Published var postFeed: [PostData]
    
    init() {
        self.postFeed = [
            PostData(title: "Sylvain", postAvatar: "sylvain", description: "Bonjour, j'ai enfin acheté une gourde ! 😆", likesCount: 4, sendTime: "Il y a 4 min"),
            PostData(title: "Nicolas", postAvatar: "nicolas", description: "Je vais acheter un vélo cet aprem !", likesCount: 29, sendTime: "Il y a 18 min"),
            PostData(title: "Renaud", postPhoto: Image("debrancherPost"), postAvatar: "renaud", description: "J'ai débranché toutes mes prises avant de partir en vacances ! 😆", likesCount: 15, sendTime: "Il y a 37 min"),
            PostData(title: "Basile", postAvatar: "basile", description: "Il était temps de faire une nouvelle action, je lave mon linge à 30° !", likesCount: 18, sendTime: "Il y a 1 h"),
            PostData(title: "Emilien", postAvatar: "emilien", description: "J'ai enfin trouvé la déchetterie dans le 15ème !", likesCount: 32, sendTime: "Il y a 5 h"),
            PostData(title: "Sylvain", postPhoto: Image("ampoulePost"), postAvatar: "sylvain", description: "J'ai changé toutes mes ampoules en LED 💡", likesCount: 43, sendTime: "Il y a 8 h"),
            PostData(title: "Sylvain", postAvatar: "sylvain", description: "J'ai acheté des bacs de tri ! 😆", likesCount: 4, sendTime: "Il y a 4 min"),
            PostData(title: "Nicolas", postAvatar: "nicolas", description: "J'ai réparé mon vélo tout seul !", likesCount: 29, sendTime: "Il y a 18 min"),
            PostData(title: "Renaud", postPhoto: Image("debrancherPost"), postAvatar: "renaud", description: "J'ai installé des prises programmateur !", likesCount: 15, sendTime: "Il y a 37 min"),
            PostData(title: "Basile", postPhoto: Image("radiateur"), postAvatar: "basile", description: "Pour cet hiver, je vais mettre mes radiateurs à 19°", likesCount: 18, sendTime: "Il y a 1 h"),
            PostData(title: "Emilien", postAvatar: "emilien", description: "J'ai enfin trouvé la déchetterie dans le 15ème !", likesCount: 32, sendTime: "Il y a 5 h"),
            PostData(title: "Sylvain", postPhoto: Image("cereales"), postAvatar: "sylvain", description: "Je prends des céréales en vrac pour avoir moins de tri", likesCount: 43, sendTime: "Il y a 8 h"),
        ]
    }
}

class LiveEvent: ObservableObject {
    @Published var liveEvent: [EventData]
    
    init() {
        self.liveEvent = [
            EventData(name: "Ramassage d'ordures", description: "Je vous propose de me rejoindre pour le nettoyage des berges du Lez ce lundi 3 mars à 9h. Le nettoyage se fera en partenariat avec l'association sentinelles des rivières", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne"], numberOfMembers: 17.0, duration: "60 min", deadline: "03/03/23", localisation: "Montpellier", userPhoto: "renaud"),
            EventData(name: "Marche pour le climat", description: "Les marches pour le climat sont des manifestations mondiales organisées par des mouvements citoyens pour demander des actions concrètes contre le changement climatique. Ces marches sont souvent l'occasion de sensibiliser le grand public aux enjeux climatiques et de demander aux gouvernements d'agir. Cette année, nous vous proposons de vous rassembler à la place de la saucisse vendredi 20 aout 2023", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"], numberOfMembers: 52, duration: "2 h", deadline: "20/11/23", localisation: "Toulouse", userPhoto: "basile"),
            EventData(name: "Marche pour le climat", description: "Les marches pour le climat sont des manifestations mondiales organisées par des mouvements citoyens pour demander des actions concrètes contre le changement climatique. Ces marches sont souvent l'occasion de sensibiliser le grand public aux enjeux climatiques et de demander aux gouvernements d'agir. Cette année, nous vous proposons de vous rassembler à la place de la saucisse vendredi 20 aout 2023", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"], numberOfMembers: 52, duration: "3 h", deadline: "20/08/23", localisation: "Toulouse", userPhoto: "sylvain"),
            EventData(name: "Discussion sur le dernier rapport du GIEC", description: "Le dernier rapport du Groupe d'experts intergouvernemental sur l'évolution du climat (GIEC) est sorti : Le GIEC est un organisme scientifique chargé d'évaluer les connaissances sur le changement climatique. Ses rapports font autorité dans le domaine et fournissent des preuves scientifiques sur les conséquences du changement climatique et les mesures à prendre. Nous vous proposons de nous réunir pour en discuter jeudi prochain à la salle de la margarine verte. Nous vous attendons nombreux", members: ["Emilie", "Hugo", "Camille", "Léa", "Ethan", "Clara", "Enzo", "Manon", "Lucas", "Emma", "Gabriel", "Louise", "Nathan", "Sarah", "Louis", "Anna", "Jules", "Zoé", "Théo", "Charlotte", "Tom", "Margot", "Mathis", "Alice", "Noah", "Inès", "Adam", "Laura", "Maxime", "Julie", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie", "Hugo", "Eva", "Arthur", "Eléonore", "Mathéo", "Marion", "Lucas", "Pauline", "Alexandre", "Manon", "Valentin", "Camille", "Maxime", "Océane", "Thomas", "Léa", "Thibault", "Emma", "Rémi", "Margot", "Baptiste", "Louise", "Raphaël", "Léa", "Antoine", "Anna", "Matteo", "Juliette", "Enzo", "Lucie", "Baptiste", "Jade", "Ethan", "Clara", "Ethan", "Alice", "Tom"], numberOfMembers: 530, duration: "2 h", deadline: "02/02/24", localisation: "Vannes", userPhoto: "nicolas"),
            EventData(name: "Journée de l'action écologique", description: "Rejoignez-nous lors de la \"Journée de l'Action Écologique : Ensemble pour notre Planète\", une initiative communautaire visant à sensibiliser, mobiliser et inciter à l'action en faveur de l'environnement. Cet événement unique rassemblera des personnes de tous âges et horizons pour collaborer à des actions concrètes en faveur de notre planète.", members: ["Emilie", "Hugo", "Camille", "Léa", "Ethan", "Clara", "Enzo", "Manon", "Lucas", "Emma", "Gabriel", "Louise", "Nathan", "Sarah", "Louis", "Anna", "Jules", "Zoé", "Théo", "Charlotte", "Tom", "Margot", "Mathis", "Alice", "Noah", "Inès", "Adam", "Laura", "Maxime", "Julie", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie"], numberOfMembers: 42, duration: "45 min", deadline: "03/05/23", localisation: "Strasbourg", userPhoto: "emilien"),
            EventData(name: "Marché local écologique", description: " : Découvrez des produits locaux, durables et respectueux de l'environnement auprès de nos exposants et encouragez l'économie locale.", members: ["Emilie", "Hugo", "Camille", "Léa", "Ethan", "Clara", "Enzo", "Manon", "Lucas", "Emma", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie", "Hugo", "Eva", "Arthur", "Eléonore", "Mathéo", "Marion", "Lucas", "Pauline", "Alexandre", "Manon", "Valentin", "Camille", "Maxime", "Océane", "Thomas", "Léa", "Thibault", "Emma", "Rémi", "Gabriel", "Louise", "Nathan", "Sarah", "Louis", "Anna", "Jules", "Zoé", "Théo", "Charlotte", "Tom", "Margot", "Mathis", "Alice", "Noah", "Inès", "Adam", "Laura", "Maxime", "Julie", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie"], numberOfMembers: 122, duration: "50 min", deadline: "03/05/23", localisation: "Strasbourg", userPhoto: "renaud")
        ]
    }
}


class DefiFeed: ObservableObject {
    @Published var defiFeed: [DefiData]
    init() {
        self.defiFeed = [
            DefiData(title: "Débranches tous tes appareils", type: "Electrique", description: "Tu as 30min à partir de l'acceptation du défi pour débrancher toutes les prises de ton domicile qui ne sont pas utilisés ou pour les appareils en veille", place: "Chez toi", duration: "30min", deadline: "03/10/2023", image: Image("debranchestesprises"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "renaud"),
            DefiData(title: "Pas de plastique aujourd'hui", type: "Déchets", description: "Tu ne dois pas utiliser de plastique aujoud'hui, pas de sacs plastique, pas de bouteille en plastique. Utilisez des sacs en tissu, des bouteilles d'eau en acier inoxydable et des contenants réutilisables", place: "Chez vous", duration: "24h", deadline: "04/10/2023", image: Image( "pasdeplastique"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "basile"),
            DefiData(title: "Consommes local!", type: "Consommation", description: "Tu ne dois acheter et consommer que des produits de ta région.", place: "Ta région", duration: "24h", deadline: "05/10/2023", image: Image("consommeslocal"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "emilien"),
            DefiData(title: "Enleves les encombrants de ta rue!", type: "Déchets", description: "La rue est vraiment très sale, ensemble nous pouvons rapidement enlever les encombrants de la rue et les amener à la décheterie du quartier ", place: "Dans ra rue", duration: "1h", deadline: "02/10/2023", image: Image("encombrants"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "sylvain"),
               DefiData(title: "Zero gaspillage alimentaire!", type: "Déchets", description: "Pendant 2 jours tu ne dois pas avoir de déchets alimentaires. Tu peux plannifier tes repas pour mieux les gérer, réutiliser les restes de manière créative ou les composter au lieu de les jeter ", place: "Chez toi", duration: "48h", deadline: "06/10/2023", image: Image("zerogaspi"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "renaud")
           ]
    }
}
