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
