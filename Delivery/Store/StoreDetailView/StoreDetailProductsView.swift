//
//  StoreDetailProductsView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let store: StoreType
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Products")
                .font(.title)
                .bold()
                .padding()
                .foregroundStyle(colorScheme == .dark ? .white : .black)

            ForEach(store.products!) { product in
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
            
        }
    }
}

#Preview {
    let viewModel = StoreViewModel()
    StoreDetailProductsView(store: viewModel.storeMock[0])
}
