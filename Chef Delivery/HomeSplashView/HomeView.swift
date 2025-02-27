//
//  ContentView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 02/01/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationBar()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20){
                        OrderTypeGridView()
                        CarrouselTabView()
                        StoreContainerView()
                    }
                }
                
            }
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            
            
        }
        
        
    }
}

#Preview {
    HomeView()
}
