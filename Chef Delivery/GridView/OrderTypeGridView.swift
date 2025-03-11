//
//  OrderTypeGridView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 03/01/25.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
    }

    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 10 ){
            ForEach(orderMock){ orderItem in
                OrderTypeView(orderType: orderItem)
            }
        }
        .frame(height: 260)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

#Preview {
    OrderTypeGridView()
}
