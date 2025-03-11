//
//  CarrouselItemView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 14/01/25.
//

import SwiftUI

struct CarrouselItemView: View {
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .padding()
    }
}

#Preview {
    CarrouselItemView(order: OrderType(id: 1, name: "banne barcecue", image: "barbecue-banner"))
}
