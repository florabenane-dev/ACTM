//
//  InventoryService.swift
//  IceCream
//
//  Created by benanflo on 12/12/2025.
//

import Foundation

/**
 Service stateless (sans état) 
 Il répond à la question : "Combien consomme cet ingrédient ?"
 */
class InventoryService {
    
    /// Retourne la quantité consommée par unité pour un ingrédient donné
    static func getConsumption(for item: Ingredient) -> Double {
        switch item.type {
        case .flavor:
            return 50.0 // 50 ml par boule
        case .container:
            return 1.0  // 1 unité
        case .topping:
            if item.name == "Whipped cream" { return 75.0 } // 75 ml
            else if item.name == "Hazelnuts" { return 5.0 } // 5 g
            return 0.0
        }
    }
}
