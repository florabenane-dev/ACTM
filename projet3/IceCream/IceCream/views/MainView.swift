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
    
    // ViewModel pour la gestion de l'état de la commande
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        List {
            // SECTION 1 : PARFUMS (SCOOPS)
            Section(header: HStack {
                Text("Scoops flavours")
                    .foregroundColor(.black)
                    .font(.body)
                    .textCase(nil)
                Spacer()
                // Utilisation du ViewModel pour les données
                if viewModel.totalScoops > 5 {
                    Text("too many scoops selected").foregroundColor(.red).font(.caption).textCase(nil)
                } else {
                    Text("maximum 5").foregroundColor(.gray).font(.caption).textCase(nil)
                }
            }) {
                ForEach(iceCreamRepository.ingredients.filter { $0.type == .flavor }) { flavor in
                    HStack {
                        if let img = flavor.image { Image(img).resizable().frame(width: 40, height: 40) }
                        Text(flavor.name)
                        Spacer()
                        
                        HStack(spacing: 7) {
                            // MOINS
                            Button(action: {
                                if (viewModel.selectedFlavors[flavor.name] ?? 0) > 0 {
                                    viewModel.selectedFlavors[flavor.name]! -= 1
                                }
                            }) {
                                Text("-").frame(width: 30, height: 30).background(Color(UIColor.systemGray5)).cornerRadius(5)
                            }
                            .disabled(flavor.stockQuantity <= 0 || (viewModel.selectedFlavors[flavor.name] ?? 0) == 0)
                            .foregroundColor((flavor.stockQuantity <= 0 || (viewModel.selectedFlavors[flavor.name] ?? 0) == 0) ? .gray : .blue)
                            .buttonStyle(PlainButtonStyle())
                            
                            // PLUS
                            Button(action: {
                                viewModel.selectedFlavors[flavor.name]! += 1
                            }) {
                                Text("+").frame(width: 30, height: 30).background(Color(UIColor.systemGray5)).cornerRadius(5)
                            }
                            // On demande au ViewModel si on peut ajouter (Logique propre)
                            .disabled(flavor.stockQuantity <= 0 || !viewModel.canAddScoop(for: flavor))
                            .foregroundColor((flavor.stockQuantity <= 0 || !viewModel.canAddScoop(for: flavor)) ? .gray : .blue)
                            .buttonStyle(PlainButtonStyle())
                            
                            if flavor.stockQuantity <= 0 {
                                NavigationLink(destination: AlertView(flavor: flavor)) {
                                    Image(systemName: "exclamationmark.circle.fill").foregroundColor(.red).font(.title2)
                                }
                                .frame(width: 30).buttonStyle(PlainButtonStyle())
                            } else {
                                Text("\(viewModel.selectedFlavors[flavor.name] ?? 0)").fontWeight(.bold).frame(width: 30, alignment: .center)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Ice cream")
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
