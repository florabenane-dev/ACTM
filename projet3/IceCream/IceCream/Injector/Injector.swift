//
//  Injector.swift
//  IceCream
//
//  Created by benanflo on 08/12/2025.
//

import Foundation

/// Responsable de l'injection du repository
///     * Pour avoir une seule source de vérité accessible partout => Pattern Singleton
class Injector {
    /// Unique et accessible dans toute l'app avec Injector.iceCreamRepository
    static let iceCreamRepository : IceCreamRepository = IceCreamRepositoryDummy()
}
