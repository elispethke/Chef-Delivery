//
//  ProductDetailButton.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct ProductDetailButton: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        
        Button{
            onButtonPress()
        } label: {
            HStack{
                Image(systemName: "cart")
                
                Text("Add to Cart")
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
            .font(.title3)
            .bold()
            .background(Color.colorOrange)
            .foregroundStyle(.white)
            .cornerRadius(12)
            .shadow(color: Color.orangeDark, radius: 9, x: 8, y: 6)
        }
       
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(radius: 8)
    }
}

#Preview {
    ProductDetailButton(onButtonPress: {})
}
