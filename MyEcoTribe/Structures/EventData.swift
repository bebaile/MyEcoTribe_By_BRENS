//
//  EventData.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import Foundation

struct EventData:Identifiable {
    
    var id = UUID()
    var name:String
    var description:String
    var members:[String] //Stack de photos des participants
    var numberOfMembers:Double // nombre de participants
    var duration:String // Temps pour réaliser le défi
    var deadline:String // Deadline a laquelle le défi sera automatiquement cloturé
    var localisation:String
    var userPhoto:String
    var computedDate:Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: deadline) ?? Date()
    }
    
    
}


var events = [
    EventData(name: "Ramassage d'ordures", description: "Je vous propose de me rejoindre pour le nettoyage des berges du Lez ce lundi 3 mars à 9h. Le nettoyage se fera en partenariat avec l'association sentinelles des rivières", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne"], numberOfMembers: 17.0, duration: "60 min", deadline: "03/03/23", localisation: "Montpellier", userPhoto: "renaud"),
    EventData(name: "Marche pour le climat", description: "Les marches pour le climat sont des manifestations mondiales organisées par des mouvements citoyens pour demander des actions concrètes contre le changement climatique. Ces marches sont souvent l'occasion de sensibiliser le grand public aux enjeux climatiques et de demander aux gouvernements d'agir. Cette année, nous vous proposons de vous rassembler à la place de la saucisse vendredi 20 aout 2023", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"], numberOfMembers: 52, duration: "2 h", deadline: "20/11/23", localisation: "Toulouse", userPhoto: "basile"),
    EventData(name: "Marche pour le climat", description: "Les marches pour le climat sont des manifestations mondiales organisées par des mouvements citoyens pour demander des actions concrètes contre le changement climatique. Ces marches sont souvent l'occasion de sensibiliser le grand public aux enjeux climatiques et de demander aux gouvernements d'agir. Cette année, nous vous proposons de vous rassembler à la place de la saucisse vendredi 20 aout 2023", members: ["kirsten", "basile", "nicolas", "renaud", "Sylvain", "Amélie", "Jeanne", "Emma", "Louise", "Jade", "Alice", "Chloé", "Léa", "Manon", "Camille", "Sarah", " Zoé"], numberOfMembers: 52, duration: "3 h", deadline: "20/08/23", localisation: "Toulouse", userPhoto: "sylvain"),
    EventData(name: "Discussion sur le dernier rapport du GIEC", description: "Le dernier rapport du Groupe d'experts intergouvernemental sur l'évolution du climat (GIEC) est sorti : Le GIEC est un organisme scientifique chargé d'évaluer les connaissances sur le changement climatique. Ses rapports font autorité dans le domaine et fournissent des preuves scientifiques sur les conséquences du changement climatique et les mesures à prendre. Nous vous proposons de nous réunir pour en discuter jeudi prochain à la salle de la margarine verte. Nous vous attendons nombreux", members: ["Emilie", "Hugo", "Camille", "Léa", "Ethan", "Clara", "Enzo", "Manon", "Lucas", "Emma", "Gabriel", "Louise", "Nathan", "Sarah", "Louis", "Anna", "Jules", "Zoé", "Théo", "Charlotte", "Tom", "Margot", "Mathis", "Alice", "Noah", "Inès", "Adam", "Laura", "Maxime", "Julie", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie", "Hugo", "Eva", "Arthur", "Eléonore", "Mathéo", "Marion", "Lucas", "Pauline", "Alexandre", "Manon", "Valentin", "Camille", "Maxime", "Océane", "Thomas", "Léa", "Thibault", "Emma", "Rémi", "Margot", "Baptiste", "Louise", "Raphaël", "Léa", "Antoine", "Anna", "Matteo", "Juliette", "Enzo", "Lucie", "Baptiste", "Jade", "Ethan", "Clara", "Ethan", "Alice", "Tom"], numberOfMembers: 530, duration: "2 h", deadline: "02/02/24", localisation: "Vannes", userPhoto: "nicolas"),
    EventData(name: "Journée de l'action écologique", description: "Rejoignez-nous lors de la \"Journée de l'Action Écologique : Ensemble pour notre Planète\", une initiative communautaire visant à sensibiliser, mobiliser et inciter à l'action en faveur de l'environnement. Cet événement unique rassemblera des personnes de tous âges et horizons pour collaborer à des actions concrètes en faveur de notre planète.", members: ["Emilie", "Hugo", "Camille", "Léa", "Ethan", "Clara", "Enzo", "Manon", "Lucas", "Emma", "Gabriel", "Louise", "Nathan", "Sarah", "Louis", "Anna", "Jules", "Zoé", "Théo", "Charlotte", "Tom", "Margot", "Mathis", "Alice", "Noah", "Inès", "Adam", "Laura", "Maxime", "Julie", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie"], numberOfMembers: 42, duration: "45 min", deadline: "03/05/23", localisation: "Strasbourg", userPhoto: "emilien"),
    EventData(name: "Marché local écologique", description: " : Découvrez des produits locaux, durables et respectueux de l'environnement auprès de nos exposants et encouragez l'économie locale.", members: ["Emilie", "Hugo", "Camille", "Léa", "Ethan", "Clara", "Enzo", "Manon", "Lucas", "Emma", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie", "Hugo", "Eva", "Arthur", "Eléonore", "Mathéo", "Marion", "Lucas", "Pauline", "Alexandre", "Manon", "Valentin", "Camille", "Maxime", "Océane", "Thomas", "Léa", "Thibault", "Emma", "Rémi", "Gabriel", "Louise", "Nathan", "Sarah", "Louis", "Anna", "Jules", "Zoé", "Théo", "Charlotte", "Tom", "Margot", "Mathis", "Alice", "Noah", "Inès", "Adam", "Laura", "Maxime", "Julie", "Nicolas", "Océane", "Alexis", "Chloé", "Victor", "Pauline", "Quentin", "Mélanie"], numberOfMembers: 122, duration: "50 min", deadline: "03/05/23", localisation: "Strasbourg", userPhoto: "renaud")

]
