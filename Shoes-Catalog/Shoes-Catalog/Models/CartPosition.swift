//
//  CartPosition.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import Foundation

struct CartPosition: Identifiable {
    let id = UUID().uuidString
    let shoes: Shoes
    var count: Int
    var size: Int
}
