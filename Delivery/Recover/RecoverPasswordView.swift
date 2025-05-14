//
//  RecoverPasswordView.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct RecoverPasswordView: View {
   // @StateObject private var viewModel = UserViewModel()
    @State private var email = ""
    @State private var recoveredPassword: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Digite seu email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Recuperar Senha") {
            //    recoveredPassword = viewModel.recoverPassword(email: email)
            }
            .buttonStyle(.borderedProminent)
            
            if let password = recoveredPassword {
                Text("Sua senha é: \(password)")
                    .foregroundColor(.blue)
            } else if recoveredPassword != nil {
                Text("Email não encontrado")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Recuperar Senha")
    }
}

#Preview {
    RecoverPasswordView()
}
