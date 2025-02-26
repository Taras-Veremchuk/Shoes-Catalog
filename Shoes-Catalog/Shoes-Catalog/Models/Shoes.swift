//
//  Shoes.swift
//  Shoes-Catalog
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

struct Shoes: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let price: Int
    let size: [Int]
    let imgTitle: String

    static func getMockData() -> [Shoes] {
        let mockData: [Shoes] = [
            .init(
                title: "Nike Red", price: 300, size: [39, 42, 44, 45],
                imgTitle: "nike"),
            .init(
                title: "Converse", price: 250, size: [41, 42, 44, 45],
                imgTitle: "converse"),
            .init(
                title: "Puma", price: 320, size: [42, 44, 45], imgTitle: "puma"),
            .init(
                title: "Vanse", price: 180, size: [40, 42, 44, 45],
                imgTitle: "vanse"),
            .init(
                title: "New Balance", price: 280, size: [41, 42, 44],
                imgTitle: "new-balance"),
            .init(
                title: "Adidas", price: 310, size: [41, 42], imgTitle: "adidas"),
            .init(
                title: "Nike Red", price: 300, size: [39, 42, 44, 45],
                imgTitle: "nike"),
            .init(
                title: "Converse", price: 250, size: [41, 42, 44, 45],
                imgTitle: "converse"),
            .init(
                title: "Puma", price: 320, size: [42, 44, 45], imgTitle: "puma"),
            .init(
                title: "Vanse", price: 180, size: [40, 42, 44, 45],
                imgTitle: "vanse"),
            .init(
                title: "New Balance", price: 280, size: [41, 42, 44],
                imgTitle: "new-balance"),
            .init(
                title: "Adidas", price: 310, size: [41, 42], imgTitle: "adidas"),
        ]
        return mockData
    }
}
