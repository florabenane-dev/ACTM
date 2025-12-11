//
//  IceCreamBuilderService.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

/**
    Service qui gère tout ce qui concerne la glace, à savoir :
        * gérer le nombre de boules de glaces selectionnée (pas de plus de 5 au total)
        * gérer le stock restant après la création d'un glace
 */

import Foundation

class IceCreamBuilderService {
    
    /// Fonction pour vérifier si on a atteint les 5 boules de glaces autorisées
    static func isScoopLimitReached(currentCount: Int) -> Bool {
           return currentCount >= 5
    }
    
    /// Fonction qui créer artificiellement la glace et met à jour les stock
    static func makeIceCream(flavors: [String: Int], container: String, toppings: [String], repository: any IceCreamRepository) {
            
            // Décrémenter le parfums (50ml / boule)
            for (flavorName, count) in flavors {
                if count > 0 {
                    repository.decreaseStock(ingredientName: flavorName, amount: Double(count) * 50)
                }
            }
            
            // Décrémenter contenant (1 unité)
            repository.decreaseStock(ingredientName: container, amount: 1)
            
            // Décrémenter le toppings
            for topping in toppings {
                if topping == "Whipped cream" {
                    repository.decreaseStock(ingredientName: topping, amount: 75) // 75ml
                } else if topping == "Hazelnuts" {
                    repository.decreaseStock(ingredientName: topping, amount: 5) // 5g
                }
            }
        }
}
