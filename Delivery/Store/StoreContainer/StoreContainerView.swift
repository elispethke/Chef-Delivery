//
//  StoreContainerView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreContainerView: View {
    @StateObject var viewModel = StoreViewModel()
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var cartViewModel: CartViewModel
    
    var stores: [StoreType]
   
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(viewModel.title)
                    .font(.headline)
                    .padding(10)
                    .foregroundStyle(Color.accent)
                    .bold()
                Spacer()
                
                Menu("Filter") {
                    
                    Button {
                        viewModel.ratingFilter = 0
                    } label: {
                        Label("Clean the filter", systemImage: "trash")
                    
                    }
                    
                    Divider()
                    
                    
                    ForEach(1...5, id: \.self) {rating in
                        Button {
                            viewModel.ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) Stars or more")
                            } else {
                                Text("\(rating) Star or more")
                            }
                        }

                    }
                }
                .foregroundStyle(Color.accent)
                .bold()
              
            }
        
        VStack(alignment: .leading, spacing: 10){
            
            if viewModel.filteredStores.isEmpty{
                Text("No results found.")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.accentColor)
                    .padding(.vertical, 30)
            } else {
                ForEach(viewModel.filteredStores, id: \.id) { store in
                    NavigationLink {
                        StoreDetailView(store: store, cartViewModel: cartViewModel)
                    } label: {
                        StoreItemView(store: store)
                    }

                }
            }
            
           
            
        }
        .foregroundStyle(colorScheme == .dark ? .white : .black)
        
     }
        .padding(10)
    }
}

#Preview {
    let cartViewModel = CartViewModel()
    StoreContainerView(cartViewModel: CartViewModel(), stores: storesMock)
}
