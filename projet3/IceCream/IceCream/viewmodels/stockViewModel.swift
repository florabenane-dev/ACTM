//
//  stockViewModel.swift
//  IceCream
//
//  Created by benanflo on 12/12/2025.
//

import Foundation

class StockViewModel: ObservableObject {
    // ÉTAT 
    @Published var selectedItems: Set<String> = []
    @Published var showMailAlert: Bool = false
    @Published var mailContent: String = ""
    
    
}
