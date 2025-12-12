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
}
