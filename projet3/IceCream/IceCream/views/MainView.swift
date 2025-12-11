//
//  OrderView.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

/**
    Vue du 1e écran, vue principale
        * elle permet de créer une glace
        * elle redérige vers AlertView quand y a pluys de stock pour un parfum de glace
 */

import SwiftUI

struct MainView: View {
    // Injection du Repository via le Singleton Injector
        @StateObject var iceCreamRepository = Injector.iceCreamRepository
        
        // États locaux
        @State private var selectedFlavors: [String: Int] = ["Chocolate": 0, "Vanilla": 0, "Pistachio": 0]
        @State private var selectedContainer: String = "Cup"
        @State private var selectedToppings: [String: Bool] = ["Whipped cream": false, "Hazelnuts": false]
        
        // Propriétés calculées
        var totalScoops: Int { selectedFlavors.values.reduce(0, +) }
        
        var totalPrice: Double {
            let containerPrice = iceCreamRepository.getIngredient(named: selectedContainer)?.price ?? 0.0
            let toppingsPrices = selectedToppings.compactMap { (name, isSelected) -> Double? in
                return isSelected ? iceCreamRepository.getIngredient(named: name)?.price : nil
            }
            return PricingService.calculateTotalPrice(scoopCount: totalScoops, containerPrice: containerPrice, extrasPrices: toppingsPrices)
        }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainView()
}
