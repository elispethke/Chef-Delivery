//
//  LoginScreen.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 27/02/25.
//

import SwiftUI


struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUpActive = false
    @State private var isPasswordVissible: Bool = false
    @FocusState private var emailFieldsFocused: Bool
    @State private var goToHomeView: Bool = false
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.fundo
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                
                ScrollView(showsIndicators: false){
                    VStack{
                        Image("LoginLogo")
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                        
                    }
                    
                    VStack(alignment: .center, spacing: 20){
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.grayClaro.opacity(0.7))
                            .cornerRadius(10)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        
                        
                        ZStack{
                            
                            Group{
                                
                                if isPasswordVissible{
                                    TextField("", text: $password)
                                } else {
                                    SecureField("Password",text: $password )
                                    
                                }
                            }
                            .padding()
                            .background(Color.grayClaro.opacity(0.7))
                            .cornerRadius(10)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            
                            HStack{
                                Spacer()
                                Button(action: {
                                    isPasswordVissible.toggle()
                                }) {
                                    Image(systemName: isPasswordVissible ? "eye" : "eye.slash")
                                        .foregroundStyle(Color.accentColor)
                                    
                                }
                                .padding(.trailing, 10)
                            }
                            
                        }
                        
                        Button(action: {
                            goToHomeView = true
                        }) {
                            Text("Enter")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .cornerRadius(12)
                                .padding()
                                .font(.headline)
                                .background(Color.fundo)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top,20)
                        
                        NavigationLink(destination: HomeView(), isActive: $goToHomeView) {
                            EmptyView()
                        }
                        
                        
                        
                        HStack{
                            Text("Don't have a account?")
                                .foregroundStyle(Color.background)
                                .font(.headline)
                                .padding(.top,30)
                            
                            NavigationLink(destination: SignUpView()) {
                                Text("Click here")
                                    .foregroundStyle(Color.accent)
                                    .fontWeight(.bold)
                                    .padding(.leading,20)
                                    .padding(.top,30)
                            }
                            
                        }
                    }
                    .padding()
                    .padding(.top, 10)
                }
            }
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $showError) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    LoginScreen()
}
