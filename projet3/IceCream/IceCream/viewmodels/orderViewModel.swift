//
//  mainViewModel.swift
//  IceCream
//
//  Created by benanflo on 12/12/2025.
//

import Foundation

/**
 ViewModel responsable de l'état de l'écran de commande.
 Il fait le lien entre la Vue (MainView) et les Services/Repository.
 */
class OrderViewModel: ObservableObject {
    
    // --- ÉTAT DE LA VUE ---
    @Published var selectedFlavors: [String: Int] = ["Chocolate": 0, "Vanilla": 0, "Pistachio": 0]
    @Published var selectedContainer: String = "Cup"
    @Published var selectedToppings: [String: Bool] = ["Whipped cream": false, "Hazelnuts": false]
    
    // Accès au repository
    private let repository = Injector.iceCreamRepository
    
    // --- LOGIQUE CALCULÉE ---
    
    var totalScoops: Int {
        selectedFlavors.values.reduce(0, +)
    }
    
    var isOrderValid: Bool {
        return totalScoops > 0 && totalScoops <= 5
    }
    
    var totalPrice: Double {
        let containerPrice = repository.getIngredient(named: selectedContainer)?.price ?? 0.0
        let toppingsPrices = selectedToppings.compactMap { (name, isSelected) -> Double? in
            return isSelected ? repository.getIngredient(named: name)?.price : nil
        }
        return PricingService.calculateTotalPrice(scoopCount: totalScoops, containerPrice: containerPrice, extrasPrices: toppingsPrices)
    }
 
    // --- ACTIONS ET VÉRIFICATIONS ---
    
    /// Vérifie si on peut ajouter une boule d'un parfum donné (Stock suffisant ?)
    func canAddScoop(for flavor: Ingredient) -> Bool {
        // conso par boule
        let consumption = InventoryService.getConsumption(for: flavor)
        
        let currentCount = selectedFlavors[flavor.name] ?? 0
        // (Quantité actuelle + 1) * consommation > Stock ?
        let needed = Double(currentCount + 1) * consumption
        
        return flavor.stockQuantity >= needed
    }
    
    /// Vérifie si on peut sélectionner un contenant ou un extra
    func canSelect(item: Ingredient) -> Bool {
        // Si c'est déjà coché, on peut cliquer pour décocher
        if let isSelected = selectedToppings[item.name], isSelected == true { return true }
        if item.type == .container && selectedContainer == item.name { return true }
        
        // Sinon, on vérifie le stock via le service
        return item.stockQuantity >= InventoryService.getConsumption(for: item)
    }
    
    
}

