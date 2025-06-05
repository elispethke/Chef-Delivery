//
//  CartView.swift
//  Delivery
//
//  Created by Elis Pethke on 28/05/25.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var  viewModel: CartViewModel
    @State private var selectedItem: CartItem?
    @State private var showingEditQuantity = false
    @State private var showingPayment = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.items){ item in
                    Button{
                        selectedItem = item
                        showingEditQuantity = true
                    } label: {
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("x\(item.quantity)")
                            Text(String(format: "€ %.2f", item.price))
                                .frame(width: 80, alignment: .trailing)
                        }
                       
                    }
                }
                .onDelete { indexSet in
                    indexSet.map { viewModel.items[$0] }.forEach(viewModel.removeFromCart)
                    
                }
            }
            .navigationTitle("Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Clear") {
                        viewModel.clearCart()
                    }
                    .padding(.top, 80)
                }
            }
            VStack{
                Spacer()
                Button("Pay"){
                    showingPayment = true
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .frame(maxWidth: .infinity)
            }
            //.background(Color(UIColor.systemGroupedBackground))
        }
        .sheet(isPresented: $showingEditQuantity ) {
            if let item = selectedItem {
                NavigationStack{
                    EditQuantityView(viewModel: viewModel, item: item)
                }
            }
        }
        .sheet(isPresented: $showingPayment) {
            NavigationStack{
                PaymenView()
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
