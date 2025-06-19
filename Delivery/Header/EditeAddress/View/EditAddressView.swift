//
//  EditAddressView.swift
//  Delivery
//
//  Created by Elis Pethke on 15/05/25.
//

import SwiftUI
import MapKit

struct EditAddressView: View {
    @ObservedObject var viewModel: EditAddressViewModel
    @Binding var addressBinding: String
    @Environment(\.dismiss) var dismiss

    let onAddressUpdated: (String) -> Void

    var body: some View {
        NavigationStack{
                VStack(spacing: 16){
                    
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(.accent)
                            .font(.system(size: 25))
                        
                        TextField("Your Address", text: $viewModel.addressText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.words)
                    }
                    .padding()
                    
                    Map(coordinateRegion: $viewModel.region)
                        .frame(height: 250)
                        .cornerRadius(12)
                        .padding(.horizontal)
                    
                    Button(action: {
                        viewModel.saveAddress()
                            addressBinding = viewModel.addressText  // Atualiza o binding
                            onAddressUpdated(viewModel.addressText) // (opcional) para logs ou ações extras
                            dismiss()
                    }) {
                        Text("Confirm Address")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accent)
                            .foregroundStyle(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .navigationTitle("Your address")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    EditAddressView(
        viewModel: EditAddressViewModel(currentAddress: "Frankfurter Allee 120"),
        addressBinding: .constant("Frankfurter Allee 120"),
        onAddressUpdated: { newAddress in
            print("Endereço atualizado: \(newAddress)")
        }
    )
}

