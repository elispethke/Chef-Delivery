//
//  CartItem.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    let id: UUID
    var name: String
    var price: Double
    var quantity: Int

    init(id: UUID = UUID(), name: String, price: Double, quantity: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
    }

    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        lhs.id == rhs.id
    }
}
