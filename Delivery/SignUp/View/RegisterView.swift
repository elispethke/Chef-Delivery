//
//  RegisterView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct RegisterView: View {
  //  @StateObject private var viewModel = UserViewModel()
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var address = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    TextField("Nome", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Senha", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Endereço", text: $address)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Registrar") {
                       // viewModel.registerUser(name: name, email: email, password: password, address: address)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Cadastro")
        }
    }
}


#Preview {
    RegisterView()
}
