//
//  StoreDetailView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        ScrollView {
                  VStack(alignment: .leading) {
                      StoreDateilHeaderView(store: store)
                      StoreDetailProductsView(store:store)

                     
                  }
                  .navigationTitle(store.name)
                  .navigationBarTitleDisplayMode(.inline)
                  .navigationBarBackButtonHidden()
                  .toolbar {
                      ToolbarItem(placement: .navigationBarLeading) {
                          Button {
                              presentationMode.wrappedValue.dismiss()
                          } label: {
                              HStack {
                                  Image(systemName: "cart")
                                  Text("Stores")
                              }
                          }
                          .foregroundColor(Color.accentColor)
                          .bold()
                      }
                  }
              }
              .frame(maxWidth: .infinity, minHeight: 500)
          }
      }
        
#Preview {
    let viewModel = StoreViewModel()
    StoreDetailView(store: viewModel.storeMock[0])
}
