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
    
    @StateObject private var viewModel = StockViewModel()
    
    var body: some View {
        VStack {
            // utilise la liste fournie par le ViewModel
            ForEach(viewModel.ingredients) { item in
                Button(action: {
                    // logique de coche du ViewModel
                    viewModel.toggleSelection(item: item, alertFlavor: alertFlavor)
                }) {
                    HStack {
                        // Vérification de l'état via le ViewModel
                        Image(systemName: viewModel.isSelected(item: item, alertFlavor: alertFlavor) ? "checkmark.square.fill" : "square")
                            .foregroundColor(viewModel.isSelected(item: item, alertFlavor: alertFlavor) ? (item.name == alertFlavor?.name ? .gray : .purple) : .gray)
                            .font(.title2)
                        
                        Text(item.name)
                            .fontWeight(item.name == alertFlavor?.name ? .bold : .regular)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Text("\(Int(max(0, item.stockQuantity))) \(item.unit)")
                            .foregroundColor(item.stockQuantity <= 0 ? .red : .primary)
                    }
                    .contentShape(Rectangle())
                }
                .disabled(item.name == alertFlavor?.name)
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical, 4)
                
                Divider()
            }
            
            
        }
    }
}

#Preview {
    StockView(alertFlavor: Ingredient(name: "Pistachio", image: nil, stockQuantity: 0, unit: "ml", type: .flavor, price: 0), signature: "Preview Signature")
            .padding()
}
