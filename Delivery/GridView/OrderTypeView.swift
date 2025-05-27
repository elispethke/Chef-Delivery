//
//  OrderTypeView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct OrderTypeView: View {
    let orderType: OrderType
    @Environment(\.colorScheme) var colorSheme
    @State private var isPressed = false
    
    var body: some View {
        VStack(spacing: 15){
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(16)
                //.fixedSize(horizontal: false, vertical: true)
            Text(orderType.name)
                .font(.headline)
                .foregroundStyle(colorSheme == .dark ? .white : .black)
                .font(.system(size: 12))
                .padding(.top,10)
        }
        .padding()
        .padding(.top,45)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 7)
                .frame(width: 110,height: 110)
                
        )
        .scaleEffect(isPressed ? 0.95 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                .onTapGesture {
                    isPressed = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isPressed = false
                    }
                }
                .frame(width: 130)
               
                
    }
}

#Preview {
    OrderTypeView(orderType: OrderType(id: 1, name: "Restaurant", image:"hamburguer1"))
}
