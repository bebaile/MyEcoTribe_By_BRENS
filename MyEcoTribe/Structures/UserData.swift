//
//  User.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import Foundation


struct UserData: Identifiable {
    var id = UUID()
    var pseudo: String
    var lastName: String
    var firstName: String
    var profilePhoto: String
    var ecoScore: Double
    var tribuName: String? // Nom de la tribu en fonction de l'écoscore
    var biography: String // Biographie de l'utilisateur
    var adresseMail: String?
    
}

var users = [
    UserData(
        pseudo: "Kirsten",
        lastName: "Steward",
        firstName: "Kirsten",
        profilePhoto: "kirsten",
        ecoScore: 88,
        biography: "🌍 Passionnée d'écologie et de protection de la planète. Ensemble, nous pouvons faire la différence pour un avenir plus vert. Rejoignez-moi dans cette aventure! #Écologie #Environnement"
    ),
    UserData(
        pseudo: "Basile",
        lastName: "Carle",
        firstName: "Basile",
        profilePhoto: "basile",
        ecoScore: 20,
        biography: "🌱 Amoureux de la nature en quête de changements positifs. Chaque petit geste compte pour préserver notre belle planète. #ÉcoWarrior"
    ),
    UserData(
        pseudo: "Nicolas",
        lastName: "Pedarros",
        firstName: "Nicolas",
        profilePhoto: "nicolas",
        ecoScore: 40,
        biography: "🌿 Passionné de durabilité et de mode de vie éco-responsable. Rejoignez-moi dans mon voyage vers un monde plus vert. #ÉcoLife"
    ),
    UserData(
        pseudo: "Renaud",
        lastName: "Gaubert",
        firstName: "Renaud",
        profilePhoto: "renaud",
        ecoScore: 20,
        biography: "🌎 Explorateur du monde naturel. Je crois en un avenir où la nature prospère aux côtés de l'humanité. #NatureLover"
    ),
    UserData(
        pseudo: "Sylvain",
        lastName: "Leguay",
        firstName: "Sylvain",
        profilePhoto: "sylvain",
        ecoScore: 77,
        biography: "🌳 Défenseur de la biodiversité et du changement climatique. Unissez-vous à moi pour protéger notre planète pour les générations futures. #Biodiversité"
    ),
    UserData(
        pseudo: "Emilien",
        lastName: "Giraud",
        firstName: "Emilien",
        profilePhoto: "emilien",
        ecoScore: 42,
        biography: "🌞 Partisan du mode de vie durable et de l'énergie renouvelable. Ensemble, nous pouvons construire un monde plus propre et plus vert. #DéveloppementDurable"
    )
]
