//
//  TipsData.swift
//  MyEcoTribe
//
//  Created by Sylvain Leguay on 21/09/2023.
//

import Foundation

struct TipsData: Identifiable {
    var id = UUID()
    var description: String
}

var tips = [
    TipsData(description: "Éteindre les lumières lorsque vous quittez une pièce peut sembler insignifiant, mais si tout le monde le faisait, cela permettrait d'économiser une quantité considérable d'énergie au fil du temps."),
    TipsData(description: "Réparer une fuite de robinet qui goutte peut économiser jusqu'à 10 000 litres d'eau par an."),
    TipsData(description: "Opter pour le vélo ou la marche pour les courtes distances au lieu de la voiture peut réduire les émissions de CO2 et améliorer votre santé."),
    TipsData(description: "Les aliments locaux ont généralement un impact environnemental moindre en raison des distances de transport plus courtes et de la réduction des émissions de gaz à effet de serre."),
    TipsData(description: "Réduire la consommation de viande peut contribuer à réduire la déforestation et les émissions de gaz à effet de serre liées à l'industrie de la viande."),
    TipsData(description: "Plutôt que de jeter des objets usagés, envisagez de les transformer en quelque chose de nouveau et utile."),
    TipsData(description: "L'installation de panneaux solaires sur votre toit peut réduire votre dépendance aux combustibles fossiles et vous faire économiser de l'argent à long terme."),
    TipsData(description: "Le recyclage responsable des appareils électroniques, tels que les téléphones portables et les ordinateurs, contribue à réduire la pollution et à préserver les ressources."),
    TipsData(description: "Utilisez des sacs réutilisables et des contenants pour vos courses au lieu de sacs en plastique à usage unique."),
    TipsData(description: "Avant d'acheter un produit, réfléchissez à sa durabilité et à son impact sur l'environnement. Privilégiez les produits durables et fabriqués de manière responsable.")
]
