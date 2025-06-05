//
//  StoreDetailProductsView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let store: StoreType
    @ObservedObject var cartViewModel: CartViewModel
    @State private var selectedProduct: ProductType?
    @State var productQuantity = 1
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Products")
                .font(.title)
                .bold()
                .padding()
            
            ForEach(store.products!) { product in
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }
            }
        }
        .sheet(item: $selectedProduct) { product in
            ProductDetailView(
                product: product,
                cartViewModel: cartViewModel
                 )
                    }
               
        }
              
        }
                
                
#Preview {
let cartViewModel = CartViewModel()
let viewModel = StoreViewModel()
StoreDetailProductsView(store: viewModel.storeMock[0],
        cartViewModel: CartViewModel())
    }
