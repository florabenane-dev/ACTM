//
//  Flavor.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

/**
    Modèle de données pour les parfum de glace
        @name, @quantity, @unit, @pricePerScoop, @image
 */

import Foundation

struct Flavor {
    var name: String
    var image: String
    var quantity: Int
    var unit: String
    
    //prix commun pour toutes les glaces
    static let pricePerScoop: [Int:Double] = [
        1: 1.50,
        2: 3,
        3: 4,
        4: 5,
        5: 5.50
    ]
}
