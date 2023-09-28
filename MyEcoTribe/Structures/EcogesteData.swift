//
//  EcogesteData.swift
//  MyEcoTribe
//
//  Created by Émilien Giraud on 20/09/2023.
//

import Foundation

struct EcogesteData:Identifiable {
    
    var id = UUID()
    var name:String // nom de l'écogeste
    var symbol:String // Logo de l'écogeste
    var description:String // Funfact ou description de l'écogeste
    var categorie:String // Catégorie de l'écogeste
    var adress:String?
    var link:String?
    var isActive:Bool
    
}

var ecogestes = [
 
    EcogesteData(name: "Vélo vs. voiture", symbol: "bicycle", description: "Pour une personne passant de la voiture au vélo un seul jour par semaine, la réduction de son empreinte carbone atteignait les 3,2 kg de CO2 ; cela équivaut aux émissions générées par une voiture parcourant 10 km, une portion d'agneau ou de chocolat ou l'envoi de 800 e-mails.", categorie: "Transport", isActive: true),
    
    EcogesteData(name: "Transport en commun vs. voiture", symbol: "bus", description: "Le bilan carbone de la voiture va jusqu'à 150g par kilomètres et par passager, alors que le bus c'est environ 100g", categorie: "Transport", isActive: false),
    
    EcogesteData(name: "Emballages durables", symbol: "trash.slash", description: "Deuxième poumon de la Terre, la forêt est essentielle à notre bien-être mais également à l’équilibre de nos écosystèmes. Pourtant en moyenne 13 millions d’hectares de forêts disparaîtraient chaque année. Vous pouvez agir en tant que consommateur en privilégiant des emballages issus de forêts gérées durablement. Grâce au label Forest Stewardship Council (FSC) vous serez ainsi assuré de disposer d’un emballage durable.", categorie: "Dechets", isActive: false),
    
    EcogesteData(name: "Poissons de pêche durable", symbol: "fish", description: "Vous aussi devenez consom’acteur en privilégiant des produits issus de la pêche durable. La peche durable n'abime pas les stocks de poissons ni les fond marins", categorie: "Alimentation", isActive: false),
    
    EcogesteData(name: "Eteindre le chauffage", symbol: "heater.vertical", description: "Lorsque vous n'êtes pas dans le logement (travail, vacances, etc.) et le chauffe-eau lors d'une absence supérieurs à deux jours.", categorie: "Logement", isActive: true),
    
    EcogesteData(name: "Couper le froid", symbol: "snowflake", description: "Couper le froid venant du sol avec des tapis et des bas de portes", categorie: "Logement", isActive: false),
    
    EcogesteData(name: "Casseroles", symbol: "frying.pan", description: "Placer un couvercle sur ses casseroles lors de la cuisson des aliments. L'équipement chauffera et l'eau va bouillir / les aliments vont cuire beaucoup plus vite. En fin de cuisson, optez pour la cuisson passive et éteignez les plaques pour profiter de l'inertie ; les plaques restant chaudes de longues minutes.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Dégivrer son réfrigérateur", symbol: "refrigerator", description: "Le Saviez-vous ? Un réfrigérateur ayant des millimètres de givre peut consommer 50% d’électricité en plus que la normale. C’est un surplus de consommation d’électricité non-négligeable.Vous pouvez éviter cela en dégivrant régulièrement votre réfrigérateur.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Laver ses vêtements à 30°C", symbol: "washer", description: "Le saviez-vous ? Laver vos vêtements à 30°C diminue considérablement la consommation énergétique de votre lave-linge. Non seulement ce sera écologique car vous économiserez de l’énergie, mais en plus vos vêtements conserveront plus leurs couleurs et leurs tissus sera moins dégradés. Augmenter la température du lavage n’est pas nécessaire car 30°C est suffisant pour bien laver vos vêtements.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Privilégier le covoiturage", symbol: "car", description: "Ces dernières années de nombreuses solutions pour parcourir des petites distances sont nées. Le covoiturage en fait partie, non seulement cela vous permet de parcourir des petites ou longue distance mais en plus vous faites du bien à l’environnement car vous n’utilisez pas votre propre voiture.", categorie: "Transport", isActive: true),
    
    EcogesteData(name: "Batch-cooking", symbol: "cooktop", description: "Cuire des aliments pour plusieurs repas, quitte à mélanger plusieurs préparations par la suite pour ne pas avoir à manger la même chose toute la semaine. Cela évite le gaspillage", categorie: "Alimentation", isActive: false),
    
    EcogesteData(name: "Lave vaisselle", symbol: "dishwasher", description: "Optez pour un programme économique qui économise de l'eau et de l'électricité", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Eviter de laisser les appareils en veille", symbol: "poweroutlet.type.e", description: "Certains appareils continuent de consommer jusqu'à 80% de leur consommation habituelle", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Eteindre son ordinateur au bureau", symbol: "lightswitch.on.square", description: "L'ordinateur, l'écran et les lumières, et débrancher les chargeurs dès que vous avez fini la journée", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Utiliser un moteur de recherche écoresponsable", symbol: "macwindow.badge.plus", description: "limiter ses recherches sur les moteurs pour privilégier les accès directs aux sites (eh oui, vos recherches Google aussi consomme de l'énergie)", categorie: "Multimédia", isActive: false),
    
    EcogesteData(name: "Imprimer responsable", symbol: "printer", description: "Imprimer le moins possible, deux documents par page (recto-verso) et réutiliser le papier comme brouillon ", categorie: "Multimédia", isActive: true),
    
    EcogesteData(name: "Mails", symbol: "envelope.badge", description: "Optimiser le stockage des emails pour limiter les émissions de CO2 par les serveurs chargés du stockage des données informatiques : se désinscrire des newsletters, nettoyer sa boite mail de temps à autre, privilégier les messages instantanés aux emails, éviter de répondre aux mails avec tout l'historique de conversation.", categorie: "Multimédia", isActive: false),
    
    EcogesteData(name: "Vaisselle réutilisable", symbol: "fork.knife", description: "Utiliser une tasse et une gourde réutilisables, Éviter les gobelets, les touillettes, les couverts en plastique et les aliments suremballés", categorie: "Alimentation", isActive: false),
    
    EcogesteData(name: "Escaliers", symbol: "figure.stairs", description: "Privilégier les escaliers à l'ascenseur (c'est même très bon pour le coeur)", categorie: "Transports", isActive: false),
    
    EcogesteData(name: "Fermer les portes", symbol: "door.left.hand.closed", description: "Je ferme les portes des pièces les moins chauffées. Vous pouvez économiser 6% de l’énergie nécessaire au chauffage en fermant les portes entre les pièces qui ne sont pas chauffées à la même température. Utilisez des “boudins de porte” pour éviter les courants d’air!", categorie: "Energie", isActive: true),
    
    EcogesteData(name: "Eteindre les appareils pendant les vacances", symbol: "lightswitch.on.square", description: "Box internet, réveils et autres appareils consomment toujours lorsqu'ils ne servent pas pendant vos semaines de vacances", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Prendre moins de bains", symbol: "bathtub", description: "Une douche consomme de 40 à 60 litres d'eau quand un bain en engloutit de 120 à 200 litres. Un bain équivaut donc à environ 5 douches, plus encore si le doucheur prend soin de couper l'eau pendant qu'il se shampooine ", categorie: "Eau", isActive: false),
     
    EcogesteData(name: "Prendre des douches de moins de 5 minutes", symbol: "shower.handheld", description: "Quand vous prenez une douche, vous consommez 2 à 4 fois moins d’eau qu’en prenant un bain. Ce- pendant cela est vrai pour une douche de 5 minutes. Sachant que le débit d’une pomme de douche classique est de 15 à 20 litres et qu’un bain nécessite 150 à 200 litres d’eau, une douche de 10 minutes revient au même qu’un bain ! Raison de plus pour choisir une pomme de douche à débit réduit qui fractionne les gouttes d’eau et permet de faire jusqu’à 50 % d’économies d’eau en maintenant le confort.", categorie: "Eau", isActive: false),
    
    EcogesteData(name: "Utiliser un bac pour faire la vaisselle", symbol: "arrow.up.bin", description: "C’est mieux que de laisser le robinet ouvert pendant toute la vaisselle : même si celui-ci est équipé d’un écomousseur !", categorie: "Eau", isActive: true),
    
    EcogesteData(name: "Récupérer l’eau de pluie", symbol: "drop.circle", description: "Pour arroser les plantes et laver la voiture. Il n’est pas nécessaire d’installer une cuve et un matériel coûteux pour commencer à récupérer l’eau de pluie : installez simplement un bac à la sortie de la gouttière de votre maison vous disposerez déjà d’un apport suffisant pour assurer la plupart de vos usages extérieurs à la maison !", categorie: "Eau", isActive: false),
    
    EcogesteData(name: "Extinction des lumières au bureau", symbol: "lightbulb", description: "10 minutes d’éclairage inutile 3 fois par jour, c’est 5 jours d’éclairage en continu sur un an ! Pensez à éteindre les lumières en partant du bureau ou d'une salle de réunion.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Economiseur d’eau sur le pommeau de douche", symbol: "shower.handheld", description: "Pensez à utiliser des économiseurs d'eau qui s'adap- tent sur les robinets et douchettes. Certains de ces équipements de qualité, pour un même confort, font économiser 50% de l'eau et, par voie de conséquence, 50% de l'énergie si c'est de l'eau chaude sanitaire. Pla- cez également des réducteurs de débit ou des mous- seurs sur vos robinets. Tous ces accessoires se trouvent facilement dans les magasins de bricolage et sont amortis en 2 ou 3 mois seulement.", categorie: "Eau", isActive: true),
    
    EcogesteData(name: "Programmer son chauffage", symbol: "heater.vertical", description: "Programmer votre chauffage à l’aide d’un thermostat est la meilleure solution pour ne chauffer que lorsque c’est (vraiment) nécessaire.", categorie: "Energie", isActive: false),
     
    EcogesteData(name: "Fermer les volets dès la nuit tombée", symbol: "door.french.open", description: "Les déperditions de chaleur sont une cause fréquente de surconsommation dans un logement. Pour éviter d’avoir besoin de trop chauffer pour vous sentir à l’aise, pensez à fermer tous vos volets dès que le soir tombe pour une meilleure isolation. Avec cette bonne habitude, vous pourrez escompter une réduction de 15 % des pertes de chaleur dans votre habitation. Cela correspond à une diminution pouvant aller jusqu’à 2 % de votre conso de chauffage.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Téléchargeemnt vs. Streaming", symbol: "arrow.down.circle", description: "Le visionnage en ligne d’une vidéo en haute définition de 10 minutes sur un smartphone équivaut à utiliser à pleine puissance un four électrique de 2000W pendant 5 minutes, or la vidéo en ligne représente plus de 60 % du trafic internet. Pour un film que l’on va regarder plusieurs fois, il est préférable d’opter pour le téléchargement, de même que pour la musique que l’on écoute en boucle. Cela permet d’éviter de solliciter à outrance les data center qui stockent ces données.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Mails", symbol: "envelope.open", description: "Conserver uniquement les mails importants et nettoyer régulièrement sa boîte mail permet d’éviter de surcharger les data center qui stockent les mails.", categorie: "Multimédia", isActive: false),
    
    EcogesteData(name: "Linge", symbol: "tshirt", description: "Étendre son linge plutôt que d’utiliser le sèche-linge", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Climatisation et voiture", symbol: "suv.side.air.fresh", description: "Éviter d’utiliser la climatisation en voiture car elle consomme du carburant", categorie: "Energie", isActive: false),
   
    EcogesteData(name: "Entretenez vos équipements", symbol: "heater.vertical", description: "En matière de chauffage et de climatisation, l’entretien fait partie des écogestes indispensables : purgez régulièrement vos radiateurs et faites vérifier votre chaudière une fois par an.", categorie: "Energie", isActive: false),
    
    EcogesteData(name: "Protéines plus respectueuses de la nature", symbol: "carrot", description: "Œufs et lait bio, poulets élevés en plein-air, poisson issu de la pêche durable : oui, c’est un peu plus cher. Mais mieux vaut en manger moins souvent et choisir ce type de produit que de participer à la négation de la nature en consommant des volatils de batterie et des produits de la mer… pêchés en détruisant leur écosystème.", categorie: "Alimentation", isActive: false),
    
    EcogesteData(name: "Limitez les emballages et autres déchets", symbol: "trash", description: "Allez… on se fixe un objectif zéro déchet dans la cuisine ! Pas simple ? Le plus important est de s’en approcher… Commencez par acheter en vrac et stocker vos denrées alimentaires dans des bocaux de verre au lieu de multiplier les emballages qui, nécessairement, finiront – au mieux ! – dans des bennes de recyclage. Préférez les yaourts sans carton marketing inutile, rechargez ce qui est rechargeable, buvez de l’eau du robinet ou en bouteilles consignées…", categorie: "Dechets", isActive: false),
     
    EcogesteData(name: "Voiture", symbol: "car.side", description: "Couper le moteur de son véhicule à l’arrêt", categorie: "Transport", isActive: false),
     
    EcogesteData(name: "Trier et recycler", symbol: "trash", description: "Dernier écogeste… mais vous l’avez certainement déjà intégré à vos habitudes : triez vos déchets, notamment verre et plastique ! Aviez-vous toutefois pensé à utiliser le marc de café pour faire du bien à vos plantes, ou vos cendres de cheminée comme anti-limace ? L’idéal, en matière de déchets alimentaires, restant évidemment de composter. Et c’est possible même si vous habitez en appartement ! Voyez à ce sujet notre article “Faire du compost dans son jardin ou en appartement : efficace et naturel !”. Vous pouvez aussi récupérez vos déchets dans une poubelle spécifique et les porter dans un biobac. La nature se chargera du reste…", categorie: "Dechets", isActive: false)
 

]
