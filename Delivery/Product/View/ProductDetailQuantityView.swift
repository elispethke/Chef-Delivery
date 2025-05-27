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
                    Image(systemName: "minus.circle.fill")                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .white : .colorOrange)
                       
                }
                
                Text("\(productQuantity)")
                    .font(.system(size: 18))
                    .bold()
                    .padding(.horizontal)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .white : .colorOrange)
                }
            }
            .padding()
            
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.accentColor, lineWidth: 1)
            )
            .padding(.bottom,80)
        }
    }
}
#Preview {
   
    ProductDetailQuantityView( productQuantity: .constant(1))
}
