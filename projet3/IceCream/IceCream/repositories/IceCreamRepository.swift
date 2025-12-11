//
//  IceCreamRepository.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

import Foundation

/// Contient les spécifications d'API, expose une liste abstraite d'ingredients en lecture

protocol IceCreamRepository {
    /// Liste abstraite accessible en lecture et écriture
    var ingredients: [Ingredient] { get set }
    
    /// Fonction pour baisser le stock
    func decreaseStock(ingredientName: String, amount: Double)
    
    /// Fonction pour récuperer un ingredient par son nom
    func getIngredient(named name: String) -> Ingredient?
}
