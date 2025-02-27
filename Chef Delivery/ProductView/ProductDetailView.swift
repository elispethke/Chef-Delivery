//
//  ProductDetailView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 04/02/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State var productQuantity = 1
    @State private var selectedExtras: Set<String> = []
    @Environment(\.colorScheme) var colorScheme
    
  
    //let extras = ["Mayonnaise", "Bacon", "Ketchup", "Egg", "Cheese", "Chili", "Lettuce", "Tomato", "Cucumber", "Onion", "Caramelized Onion"]
    
    var body: some View {
        ZStack{
            VStack{
                    ProductDetailHeaderView(product: product)
                
                
                
                Spacer()
                
                ProductDetailQuantityView(productQuantity: $productQuantity)
               
                Text("Total: \(product.totalPrice(for: productQuantity))")
                    .font(.headline)
                    .foregroundStyle(Color.red)
                    .bold()
                    .padding(.bottom,30)
                
                Spacer()
                
                ProductDetailButton()
                .padding(.bottom,40)
                
                }
            }
        }
    }

#Preview {
    let viewModel = StoreViewModel()
    return ProductDetailView(product: viewModel.storeMock[0].product[0])
}
