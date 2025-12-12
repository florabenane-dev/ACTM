//
//  StockView.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

/**
    Vue pour le stock qui affiche :
        * elle affiche  la liste de tous les élements  {nom, quantité, unité} de tous les élements {cup et ingredients} avec des cases à cocher
        * un bouton "Order" qui envoie du mail pour plusieurs élements {cup et ingredients}
        * un bouton "Collapse other items" pour masquer la liste

 */

import SwiftUI

struct StockView: View {
    @ObservedObject var iceCreamRepository = Injector.iceCreamRepository
    
    // Le parfum qui a déclenché l'alerte
    var alertFlavor: Ingredient?
    var signature: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StockView(alertFlavor: Ingredient(name: "Pistachio", image: nil, stockQuantity: 0, unit: "ml", type: .flavor, price: 0), signature: "Preview Signature")
            .padding()
}
