//
//  alertViewModel.swift
//  IceCream
//
//  Created by benanflo on 12/12/2025.
//

import Foundation

class AlertViewModel: ObservableObject {
    // ÉTAT
    @Published var signature: String = "Thanks, MB"
    @Published var showStock: Bool = false
    
    // Gestion de la popup
    @Published var showMailAlert: Bool = false
    @Published var mailContent: String = ""
    
    
    // LOGIQUE
    /// Envoie l'alerte pour le parfum vide
    func sendAlert(for flavorName: String) {
        let itemToOrder = "\(flavorName) icecream"
        
        // Appel au service mail
        mailContent = MailService.generateMailBody(items: [itemToOrder], signature: signature)
        MailService.sendOrder(items: [itemToOrder], signature: signature)
        
        showMailAlert = true
    }
    
    /// Bascule l'affichage du stock
    func toggleStockVisibility() {
        showStock.toggle()
    }
}
