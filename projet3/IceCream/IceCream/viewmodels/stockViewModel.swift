//
//  stockViewModel.swift
//  IceCream
//
//  Created by benanflo on 12/12/2025.
//

import Foundation

class StockViewModel: ObservableObject {
    // ÉTAT 
    @Published var selectedItems: Set<String> = []
    @Published var showMailAlert: Bool = false
    @Published var mailContent: String = ""
    
    //  LOGIQUE
    /// Initialise la sélection avec le parfum en alerte (s'il existe)
    func initializeSelection(alertFlavor: Ingredient?) {
        if let name = alertFlavor?.name {
            selectedItems.insert(name)
        }
    }
    
    /// Gère le clic sur une ligne (Cocher/Décocher)
    func toggleSelection(item: Ingredient, alertFlavor: Ingredient?) {
        // Règle métier : On ne peut pas décocher le parfum qui a déclenché l'alerte
        if item.name == alertFlavor?.name { return }
        
        if selectedItems.contains(item.name) {
            selectedItems.remove(item.name)
        } else {
            selectedItems.insert(item.name)
        }
    }
    
    /// Vérifie si un item est sélectionné
    func isSelected(item: Ingredient, alertFlavor: Ingredient?) -> Bool {
        return selectedItems.contains(item.name) || item.name == alertFlavor?.name
    }
}
