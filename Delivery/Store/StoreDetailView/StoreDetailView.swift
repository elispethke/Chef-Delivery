//
//  StoreDetailView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var cartViewModel: CartViewModel
    @State private var showingCart = false
    @State private var showingEditQuantity = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StoreDateilHeaderView(store: store)
                StoreDetailProductsView(store: store, cartViewModel: cartViewModel)
            }
            //.padding()
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            // Botão de Voltar
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Stores")
                    }
                }
                .foregroundColor(Color.accentColor)
                .bold()
            }

            // Botão do Carrinho
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingCart = true
                } label: {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "cart.fill")
                            .imageScale(.large)
                        if cartViewModel.totalItems > 0 {
                            Text("\(cartViewModel.totalItems)")
                                .font(.caption2)
                                .foregroundStyle(.white)
                                .padding(4)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)
                        }
                    }
                }
               
                .accessibilityLabel("Cart with \(cartViewModel.totalItems)")
            }
            
           
        }
        
        .sheet(isPresented: $showingCart) {
            CartView(viewModel: cartViewModel)
                .interactiveDismissDisabled(false)
               
        }
        
    }
}

#Preview {
    let cartViewModel = CartViewModel()
    let viewModel = StoreViewModel()
    return NavigationStack {
        StoreDetailView(store: viewModel.storeMock[0], cartViewModel: cartViewModel)
    }
}
