//
//  IceCreamRepositoryDummy.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

import Foundation

/// Implementation concrète du repository IceCreamRepository
class IceCreamRepositoryDummy: IceCreamRepository {
    
    var ingredients: [Ingredient] = [
        // Parfums
        Ingredient(name: "Chocolate", image: "chocolate", stockQuantity: 300, unit: "ml", type: .flavor, price: 0),
        Ingredient(name: "Vanilla", image: "vanilla", stockQuantity: 100, unit: "ml", type: .flavor, price: 0),
        Ingredient(name: "Pistachio", image: "pistachio", stockQuantity: 0, unit: "ml", type: .flavor, price: 0),
        
        // Contenants
        Ingredient(name: "Cone", image: nil, stockQuantity: 2, unit: "unit", type: .container, price: 1.0),
        Ingredient(name: "Cup", image: nil, stockQuantity: 7, unit: "unit", type: .container, price: 0.0),
                
        // Supplèments
        Ingredient(name: "Whipped cream", image: nil, stockQuantity: 150, unit: "ml", type: .topping, price: 0.95),
        Ingredient(name: "Hazelnuts", image: nil, stockQuantity: 100, unit: "g", type: .topping, price: 1.30)
    ]
    
    /// baisser le stock
    func decreaseStock(ingredientName: String, amount: Double) {
        //chercher l'index de l'element qui a ce nom
        if let index = ingredients.firstIndex(where: { $0.name == ingredientName}) {
            ingredients[index].stockQuantity -= amount
        }
    }
    
    /// récuperer un ingredient par son nom
    func getIngredient(named name: String) -> Ingredient? {
        <#code#>
    }
}
