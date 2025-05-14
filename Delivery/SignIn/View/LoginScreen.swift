//
//  LoginScreen.swift
//  Delivery
//
//  Created by Elis Pethke on 01/04/25.
//

import SwiftUI

struct LoginScreen: View {
    //@StateObject private var viewModel = UserViewModel()
        @State private var email = ""
        @State private var password = ""
        @State private var navigateToHome = false
        
        var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 20) {
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField("Senha", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                               
                        }
                        
                        Button("Entrar") {
                            //
                        }
                        .buttonStyle(.borderedProminent)
                        
                        NavigationLink("Esqueceu a senha?", destination: RecoverPasswordView())
                    }
                    .padding()
                    .navigationDestination(isPresented: $navigateToHome) {
                        HomeView()
                    }
                }
                .navigationTitle("Login")
            }
        }
    

#Preview {
    LoginScreen()
}
