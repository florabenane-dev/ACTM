//
//  MailService.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//
/**
    Service pour envoyer un mail à order@icecream.com avec
        * titre "order"
        * message "Hi, Please order the following *{parfum de glace} Thanks, MB"
 */

import Foundation
import UIKit

class MailService {
    
    /// Ouvre l'application Mail pré-remplie
       static func sendOrder(items: [String], signature: String) {
           // préparer le contenu
           let recipient = "order@icecream.com"
           let subject = "Order"
          
           let itemsList = items.map { "* \($0)" }.joined(separator: "\n")
           let body = """
           Hi,
           Please order the following:
           \(itemsList)
           
           \(signature)
           """
          
           // Créer l'URL mailto
           // encoder les espace et les retour à la ligne pour l'url (espace=%20)
           if let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "mailto:\(recipient)?subject=\(encodedSubject)&body=\(encodedBody)") {
              
               // 3. Ouverture de l'URL par le système iOS
               if UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.open(url)
               } else {
                   print("Impossible d'ouvrir l'application Mail (Simulateur ou pas de compte configuré)")
               }
           }
       }
}
