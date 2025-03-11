//
//  ProductType.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 30/01/25.
//

import Foundation

struct ProductType: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "€" + price.formatPrice()
    }
    
    func totalPrice(for quantity: Int) -> String {
        let total = Double(quantity) * price
        return "€" + total.formatPrice()
    }
}
