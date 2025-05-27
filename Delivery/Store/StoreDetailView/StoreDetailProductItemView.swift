//
//  StoreDetailProductItemView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//


import SwiftUI

struct StoreDetailProductItemView: View {
    let product: ProductType
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                    .foregroundStyle(colorScheme == .dark ? .white : .black)

                Text(product.description)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)

                Text(product.formattedPrice)
                    .bold()
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
            }
            Spacer()
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 8, y: 10)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

#Preview {
    let viewModel = StoreViewModel()
    StoreDetailProductItemView(product: (viewModel.storeMock[0].products?[0])!)
}
