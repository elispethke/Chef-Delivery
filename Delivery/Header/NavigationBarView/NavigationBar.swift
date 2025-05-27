//
//  NavigationBar.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.colorScheme) var colorSheme
    @State private var isEditingAddress = false
    @AppStorage("savedAddress") private var currentAddress = "Frankfurter Allee 120"

    @State private var showEditAddress = false
    @State private var showSideMenu = false
    
    
    var body: some View {
        
            HStack{
                Spacer()
                
                Button(action: {
                    isEditingAddress = true
                }) {
                    HStack{
                        Text(currentAddress)
                            .font(.headline)
                            .foregroundStyle(colorSheme == .dark ? .white : .black)
                        Image(systemName: "chevron.down")
                    }
                }
                
                .sheet(isPresented: $isEditingAddress) {
                    let viewModel = EditAddressViewModel(currentAddress: "FrankFurte Allee 90")
                    EditAddressView(viewModel: viewModel, addressBinding: $currentAddress) { newAddress in
                        print("New Address \(newAddress)")
                    }
                }
                
                Spacer()
                
                Button( action: {
                    withAnimation {
                        showSideMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 22))
                        .foregroundStyle(.accent)
                        .fontWeight(.bold)
                        .padding()
                    
                }
                
                NavigationLink(destination: SideMenuView(isShowing: $showSideMenu ), isActive: $showSideMenu) {
                                EmptyView()
                            }
                            .hidden()
                
            }
           
        
            .padding(.horizontal)
            .padding(.top, 5)
            .frame(height: 80)
            .background(.ultraThinMaterial)
        
        
        
       
         Spacer()
        
            .navigationDestination(isPresented: $showEditAddress) {
                EditAddressView(viewModel: EditAddressViewModel(currentAddress: currentAddress), addressBinding: $currentAddress,
                                onAddressUpdated: { newAddress in
                    currentAddress = newAddress
                }
                )
            }
        
        
    }
}

#Preview {
    NavigationBar()
}

