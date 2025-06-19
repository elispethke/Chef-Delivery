//
//  CartView.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var  viewModel: CartViewModel
    //@State private var selectedItem: CartItem?
    //  @State private var showingEditQuantity = false
    @State private var showingPayment = false
    
    var totalPrice: Double {
        viewModel.items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.items.isEmpty {
                    Spacer()
                    Text("Your Cart is empty")
                        .foregroundStyle(.darkGray)
                } else {
                    List(viewModel.items) { item in
                        CartItemRowView(item: item, viewModel: viewModel)
                    }
                    .listStyle(.insetGrouped)
                    
                    Divider()
                    
                    HStack {
                        Text("Total")
                            .font(.title)
                            .foregroundStyle(.black)
                            .bold()
                        
                        Spacer()
                        
                        Text(String(format: "€ %.2f", totalPrice))
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.accent)
                    }
                    .padding()
                    
                    Button("Pay"){
                        showingPayment = true
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 10)
                    .font(.title2)
                    .bold()
                    .background(Color.accent)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .shadow(color: Color.orangeDark,radius: 9, x: 8, y: 6)
                }
            }
            .navigationTitle("Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Clean"){
                        viewModel.clearCart()
                    }
                    .disabled(viewModel.items.isEmpty)
                }
            }
        }
        .sheet(isPresented: $showingPayment) {
            NavigationStack{
                PaymentView()
            }
        }
    }
}


#Preview {
    let cartViewModel = CartViewModel()
    let vm = CartViewModel()
    vm.addToCart(item: CartItem(name: "Burger", price: 5.99, quantity: 2))
    vm.addToCart(item: CartItem(name: "Fries", price: 2.49, quantity: 1))
    return CartView(viewModel: vm)
    //CartView(viewModel: CartViewModel())
}
