//
//  Ingredient.swift
//  IceCream
//
//  Created by benanflo on 10/12/2025.
//

import Foundation

/// Définit la catégorie d'un ingrédient
///     Utiliser pour classer les articles dans l'interface ou appliquer des logiques de prix différentes
enum IngredientType {
    /// parfum principal (Vanille, Chocolat, pistache)
    case flavor
    
    /// support  (Coupe, cône)
    case container
    
    /// garniture (éclats de noisettes, Chantilly)
    case topping
}

/// Représente un ingrédient  dans l'inventaire.
///     * contient les données de l'ingrédient (nom, prix) et son état dans l'interface de stock
struct Ingredient: Identifiable {
    
    // MARK: - Propriétés de l'inventaire
    
    let id = UUID()
    
    /// Le nom
    let name: String
    
    /// L'image des parfum, et qui nil pour les coupes et toping
    let image: String?
    
    /// La quantité actuellement disponible en stock
    var stockQuantity: Double
    
    /// L'unité de mesure associée à la quantité
    let unit: String
    
    /// La catégorie (Parfum, Contenant ou Garniture)
    let type: IngredientType
    
    /// Le prix unitaire
    let price: Double
    
    // MARK: - État de l'interface
    /// Indique si l'ingrédient est sélectionné dans la page "Check all items"
    ///     * La valeur par défaut est `false`
    var isSelectedForOrder: Bool = false
}
