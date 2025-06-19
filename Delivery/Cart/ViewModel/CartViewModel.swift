//
//  CartViewModel.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import Foundation

@MainActor
class CartViewModel: ObservableObject{
    @Published var items: [CartItem] = []
    
    var totalItems: Int {
        items.reduce(0){ $0 + $1.quantity }
        
        
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    func addToCart(item: CartItem) {
        if let index = items.firstIndex(where: { $0.name == item.name }){
            items[index].quantity += item.quantity
        } else{
            items.append(item)
        }
    }
    
    func removeFromCart(item: CartItem){
        items.removeAll { $0.id == item.id }
    }
    
    func clearCart(){
        items.removeAll()
    }
    
    func updateQuantity(for item: CartItem, quantity: Int) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].quantity = max(quantity, 1)
    }
    
    func incrementQuantity(for item: CartItem){
        guard let index = items.firstIndex(where: { $0.id == item.id }) else{return}
        items[index].quantity += 1
    }
    
    func decrementQuantity(for item: CartItem) {
            guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                removeFromCart(item: item)
            }
        }

}
