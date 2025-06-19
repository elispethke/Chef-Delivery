//
//  SearchStoreView.swift
//  Delivery
//
//  Created by Elis Pethke on 21/05/25.
//

import SwiftUI

struct SearchStoreView: View {
    @ObservedObject var viewModel: SearchStoreViewModel
    
    
    var searchTextView: some View {
        HStack {
            TextField("Search from Chef Delivery", text: $viewModel.searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button {
                viewModel.searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .padding(.top, 8)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    searchTextView
                        .listRowSeparator(.hidden)
                    
                    if let filteredStore = try? viewModel.filteredStores() {
                        ForEach(filteredStore, id: \.id) { store in
                            Text(store.name)
                                .font(.custom("Futura", size: 16))
                                .listRowInsets(EdgeInsets())
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                    
                    } else {
                        VStack(alignment: .center) {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.accentColor)
                                .padding(.top, 50)
                                .frame(height: 100)
                                .frame(maxWidth: .infinity)
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .padding(.top, 15)
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                
                Spacer()
            }
        }
    }

}

#Preview {
    SearchStoreView(viewModel: SearchStoreViewModel(service: SearchService()))
}
