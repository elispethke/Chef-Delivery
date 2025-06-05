//
//  ProductType.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import Foundation

struct ProductType: Identifiable, Codable, Equatable  {
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
