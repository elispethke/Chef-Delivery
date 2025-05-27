//
//  ProductDetailHeaderView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    let product: ProductType
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 30)
            
         
                Text(product.name)
                    .font(.title)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                Text(product.description)
                    .padding(.horizontal)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
          
        }

    }
}

#Preview {
    let viewModel = StoreViewModel()
    ProductDetailHeaderView(product: (viewModel.storeMock[0].products?[0])!)
}
