//
//  SituationData.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import Foundation 

struct SituationData:Identifiable, Hashable {
    
    var id = UUID()
    var name:String
    var symbol:String
    // Catégorie de la situation ex: vélo/voiture
    var section:String
    
}

var situations = [
    SituationData(name: "A vélo", symbol: "bicycle", section: "Je me déplace..."),
    SituationData(name: "En voiture", symbol: "car", section: "Je me déplace..."),
    SituationData(name: "En bus", symbol: "bus", section: "Je me déplace..."),
    SituationData(name: "En ville", symbol: "building.2", section: "J'habite..."),
    SituationData(name: "En périphérie", symbol: "house", section: "J'habite..."),
    SituationData(name: "En Campagne", symbol: "tent", section: "J'habite..."),
    SituationData(name: "Une gourde", symbol: "drop", section: "Je possède..."),
    SituationData(name: "Des couverts réutilisables", symbol: "fork.knife", section: "Je possède..."),
    SituationData(name: "Des ampoules LED", symbol: "lightbulb", section: "Je possède..."),
    SituationData(name: "Du shampooing solide", symbol: "shower", section: "Je possède..."),
    SituationData(name: "Pas du tout", symbol: "chart.bar", section: "Je trie..."),
    SituationData(name: "Un peu", symbol: "chart.bar", section: "Je trie..."),
    SituationData(name: "Tous les déchets", symbol: "chart.bar.fill", section: "Je trie..."),
]
