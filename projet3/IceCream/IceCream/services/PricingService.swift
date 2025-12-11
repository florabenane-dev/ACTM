//
//  PricingService.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

/**
    Service pour calculer le prix en fonction des élements choisis
 */

import Foundation

class PricingService {
    
    /// Fonction statique qui  calcule le prix totale de la glace
    static func calculateTotalPrice(scoopCount: Int, containerPrice: Double, extrasPrices: [Double]) -> Double {
        var price = 0.0
        
        // Prix des boules
        switch scoopCount {
        case 1: price = 1.50
        case 2: price = 3.00
        case 3: price = 4.00
        case 4: price = 5.00
        case 5: price = 5.50
        default: break
        }
        
        // Ajouter prix contenant
        price += containerPrice
        
        // Ajouter prix extras
        for extraPrice in extrasPrices {
            price += extraPrice
        }
        
        return price
    }
}
