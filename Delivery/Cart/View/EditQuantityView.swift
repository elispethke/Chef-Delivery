//
//  EditQuantityView.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import SwiftUI

struct EditQuantityView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var cartViewModel: CartViewModel
    var item: CartItem
    
    @State private var quantity: Int
        
        init(viewModel: CartViewModel, item: CartItem) {
            self.cartViewModel = viewModel
            self.item = item
            _quantity = State(initialValue: item.quantity)
        }
    
    var body: some View {
        VStack(spacing: 20){
            Text(item.name)
                .font(.title)
                .padding()
            
            HStack(spacing: 40){
                Button{
                    if quantity > 1{
                        quantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(quantity > 1 ? .accent : .gray)
                }
                Text("\(quantity)")
                    .font(.title)
                    .frame(width: 40)
                Button{
                    quantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.accent)
                }
            }
            Spacer()
            
            Button("Save"){
                cartViewModel.updateQuantity(for: item, quantity: quantity)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .navigationTitle("Edit Quantity")
    }
}

#Preview {
    let cartViewModel = CartViewModel()
    EditQuantityView(viewModel: CartViewModel(), item: CartItem(name: "", price: 12, quantity: 1))
}
