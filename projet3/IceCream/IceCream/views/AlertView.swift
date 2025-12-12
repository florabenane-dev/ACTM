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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        AlertView(flavor: Ingredient(name: "Pistachio", image: "pistachio", stockQuantity: 0, unit: "ml", type: .flavor, price: 0))
    }
}
