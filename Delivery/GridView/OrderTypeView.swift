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
    
    var body: some View {
        VStack(spacing: 5){
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: true)
            Text(orderType.name)
                .font(.headline)
                .foregroundStyle(colorSheme == .dark ? .white : .black)
                .font(.system(size: 10))
        }
        .frame(width: 90, height: 100)
    }
}

#Preview {
    OrderTypeView(orderType: OrderType(id: 1, name: "Restaurant", image:"hamburguer"))
}
