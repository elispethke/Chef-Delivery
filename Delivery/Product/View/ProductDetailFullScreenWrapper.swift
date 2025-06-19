//
//  ProductDetailFullScreenWrapper.swift
//  Delivery
//
//  Created by Elis Pethke on 05/06/25.
//

import SwiftUI

struct ProductDetailFullScreenWrapper: View {
    let product: ProductType?
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        if let product = product {
            ProductDetailView(
                product: product,
                cartViewModel: cartViewModel,
                isPresented: $isPresented
            )
        } else {
            VStack(spacing: 16) {
                ProgressView()
                Text("Carregando produto...")
                    .foregroundColor(.gray)
                Button("Fechar") {
                    isPresented = true
                }
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        }
    }
}

#Preview {
    @State var isPresented = true
    let cartViewModel = CartViewModel()
    let mockProduct = ProductType(
        id: 1,
        name: "Angus burger",
        description: "Delicious handmade burger with cheddar cheese.",
        image: "burger",
        price: 12.99
    )
    
    return ProductDetailFullScreenWrapper(
        product: mockProduct,
        cartViewModel: cartViewModel,
        isPresented: $isPresented
    )
}
