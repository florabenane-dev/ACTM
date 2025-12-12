//
//  AlertView.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

/**
    Vue du bouton Alert (quand y a plus de stock pour un parfum de glace) :
        * elle affiche
            * l'image,
            * nom du parfum
            * message " {nom parfum} is empty"
        * elle envoie un mail à order@icecream.com  en cliquant sur le bouton "Order" avec :
             * titre "order"
             * message "Hi, Please order the following *{parfum de glace} Thanks, MB"
        *Redérige vers {StockView} en cliquant sur le bouton "Check all items"
 */

import SwiftUI

struct AlertView: View {
    let flavor: Ingredient
    // viewmodel
    @StateObject private var viewModel = AlertViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Bloc Image + Message "is empty"
                HStack(spacing: 20) {
                    if let img = flavor.image {
                        Image(img)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    
                    Text("\(flavor.name) flavour\nis empty")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            }
            
            // Champ Signature et Bouton Order
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Signature")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    // Liaison avec le ViewModel
                    TextField("Signature", text: $viewModel.signature)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button("Order") {
                    // viewModel fait la logique
                    viewModel.sendAlert(for: flavor.name)
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .disabled(viewModel.signature.isEmpty || viewModel.showStock)
                .alert("Récapitulatif du mail envoyé", isPresented: $viewModel.showMailAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(viewModel.mailContent)
                }
            }
            
            // Bouton Check/Collapse
            Button(action: {
                withAnimation {
                    viewModel.toggleStockVisibility()
                }
            }) {
                Text(viewModel.showStock ? "Collapse other items" : "Check all items")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.vertical, 10)
            
        }
        .navigationTitle(flavor.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        AlertView(flavor: Ingredient(name: "Pistachio", image: "pistachio", stockQuantity: 0, unit: "ml", type: .flavor, price: 0))
    }
}
