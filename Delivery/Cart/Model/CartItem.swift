//
//  CartItem.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Int
}
