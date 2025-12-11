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
    static let iceCreamRepository : IceCreamRepository = IceCreamRepositoryDummy()
}
