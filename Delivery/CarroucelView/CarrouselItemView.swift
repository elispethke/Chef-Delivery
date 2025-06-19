//
//  CarrouselItemView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//


import SwiftUI

struct CarrouselItemView: View {
    let order: OrderType
    @Environment(\.colorScheme) var colorSheme
    
    var body: some View {
        VStack{
            Image(order.image)
                .resizable()
                .scaledToFit()
                .frame(width: 350)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .frame(width: 350, height: 180)
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
        .background(colorSheme == .dark ? Color.darkGray.opacity(0.5) : Color.white)
        .cornerRadius(16)
        
        
        .padding()
        .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 7)
    }
}

#Preview {
    CarrouselItemView(order: OrderType(id: 1, name: "banne barcecue", image: "barbecue-banner"))
}
