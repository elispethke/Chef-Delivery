//
//  CartItemRowView.swift
//  Delivery
//
//  Created by Elis Pethke on 07/06/25.
//

import SwiftUI

struct CartItemRowView: View {
    let item: CartItem
    @ObservedObject var viewModel: CartViewModel
    @State private var animatedQuantity = false
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text(String(format: "€ %.2f", item.price))
                    .font(.subheadline)
                    .foregroundStyle(.accent)
            }
            Spacer()
            
            HStack(spacing: 15){
                Button{
                    if let currentItem = viewModel.items.first(where: {$0.id == item.id}){
                        viewModel.decrementQuantity(for: currentItem)
                        animated()
                    }
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                Text("\(item.quantity)")
                    .font(.headline)
                    .frame(width: 30)
                    .scaleEffect(animatedQuantity ? 1.3 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: animatedQuantity)
                
                Button{
                    if let currentItem = viewModel.items.first(where: {$0.id == item.id}){
                        viewModel.incrementQuantity(for: currentItem)
                        animated()
                    }
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .foregroundStyle(.black)
                }
            }
        }
        .padding(.vertical,5)
    }
    
    private func animated() {
        animatedQuantity = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            animatedQuantity = false
        }
    }
}

#Preview {
    let mockItem = CartItem(name: "Shushi", price: 12.99, quantity: 2)
    let mockViewModel = CartViewModel()
    mockViewModel.addToCart(item: mockItem)
    CartItemRowView(item: mockItem, viewModel: mockViewModel)
    return CartItemRowView(item: mockItem, viewModel: mockViewModel)
            .padding()
            .previewLayout(.sizeThatFits)
}
