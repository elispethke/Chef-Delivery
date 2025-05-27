//
//  OrderTypeGridView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//


import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(),spacing: 20), count: 3)
    }

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(ordersMock) { orderItem in
                    OrderTypeView(orderType: orderItem)
                        .transition(.scale)
                        .animation(.easeIn(duration: 0.3), value: orderItem.id)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .padding(.top, 40)
        }
        .frame(height: 100)
    }
}
        
        
        
        
        
        /*
        LazyHGrid(rows: gridLayout, spacing: 20) {
            ForEach(ordersMock) { orderItem in
                        OrderTypeView(orderType: orderItem)
                    }
                }
        .frame(height: 140)
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .padding(.bottom,15)
        .cornerRadius(12)
         */
        
 

#Preview {
    OrderTypeGridView()
}
