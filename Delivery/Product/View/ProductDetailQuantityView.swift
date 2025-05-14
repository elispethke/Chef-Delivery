//
//  ProductDetailQuantityView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct ProductDetailQuantityView: View {
   
    @Environment(\.colorScheme) var colorScheme
    @Binding var productQuantity: Int
    
    var body: some View {
        VStack(spacing: 16) {
            
            HStack{
                Button {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
                
                Text("\(productQuantity)")
                    .font(.system(size: 18))
                    .bold()
                    .padding(.horizontal)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 15))
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
            }
            .padding()
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            .padding(.bottom,80)
        }
    }
}
#Preview {
   
    ProductDetailQuantityView( productQuantity: .constant(1))
}
