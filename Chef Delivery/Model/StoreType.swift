//
//  StoreType.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 30/01/25.
//

import Foundation

struct StoreType: Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let deliveryTime: String
    let rating: Double
    let reviewCount: Int
    let product: [ProductType]
    let deliveryPrice: Double
}

