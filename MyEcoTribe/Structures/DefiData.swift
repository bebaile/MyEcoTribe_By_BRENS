//
//  DefiData.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import Foundation
import SwiftUI

struct DefiData: Identifiable {
    var id = UUID()
    var title: String
    var type: String
    var description: String
    var place: String
    var duration: String
    var deadline: String
    var image: Image
    var members: [String]
    var numberOfMembers: Int
    var computedDate: Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.date(from: deadline) ?? Date()
        }
    var utilisateurPhoto: String
    }


var defis = [
    DefiData(title: "Débranches tous tes appareils", type: "Electrique", description: "Tu as 30min à partir de l'acceptation du défi pour débrancher toutes les prises de ton domicile qui ne sont pas utilisés ou pour les appareils en veille", place: "Chez toi", duration: "30min", deadline: "03/10/2023", image: Image("debranchestesprises"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "renaud"),
    DefiData(title: "Pas de plastique aujourd'hui", type: "Déchets", description: "Tu ne dois pas utiliser de plastique aujoud'hui, pas de sacs plastique, pas de bouteille en plastique. Utilisez des sacs en tissu, des bouteilles d'eau en acier inoxydable et des contenants réutilisables", place: "Chez vous", duration: "24h", deadline: "04/10/2023", image: Image( "pasdeplastique"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "basile"),
    DefiData(title: "Consommes local!", type: "Consommation", description: "Tu ne dois acheter et consommer que des produits de ta région.", place: "Ta région", duration: "24h", deadline: "05/10/2023", image: Image("consommeslocal"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "emilien"),
    DefiData(title: "Enleves les encombrants de ta rue!", type: "Déchets", description: "La rue est vraiment très sale, ensemble nous pouvons rapidement enlever les encombrants de la rue et les amener à la décheterie du quartier ", place: "Dans ra rue", duration: "1h", deadline: "02/10/2023", image: Image("encombrants"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "sylvain"),
       DefiData(title: "Zero gaspillage alimentaire!", type: "Déchets", description: "Pendant 2 jours tu ne dois pas avoir de déchets alimentaires. Tu peux plannifier tes repas pour mieux les gérer, réutiliser les restes de manière créative ou les composter au lieu de les jeter ", place: "Chez toi", duration: "48h", deadline: "06/10/2023", image: Image("zerogaspi"), members: ["Basile", "Emilie", "Nicolas", "Sylvain", "Renaud"], numberOfMembers: 5, utilisateurPhoto: "nicolas")
   ]
