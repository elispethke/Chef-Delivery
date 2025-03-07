//
//  SignUpView.swift
//  Chef Delivery
//
//  Created by Elis Pethke on 27/02/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var address = ""
    @State private var post = ""
    @State private var city = ""
    @State private var country = ""
    @State private var phoneNumber = ""
    @State private var isSignUpActive = false
    @State private var isPasswordVissible: Bool = false
    @FocusState private var emailFieldsFocused: Bool
    
    @State private var goToLogin = false
    @State private var errorMessage = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.fundo
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                
              
                VStack(alignment: .center, spacing: 20){
                    
                    Text("Register")
                        .foregroundStyle(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.grayClaro.opacity(0.7))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.grayClaro.opacity(0.7))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color.grayClaro.opacity(0.7))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    TextField("Address", text: $address)
                        .padding()
                        .background(Color.grayClaro.opacity(0.7))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    TextField("Post", text: $post)
                        .padding()
                        .background(Color.grayClaro.opacity(0.7))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    TextField("City", text: $city)
                        .padding()
                        .background(Color.grayClaro.opacity(0.7))
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    TextField("Phon Number", text: $phoneNumber)
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
                                SecureField("Confirm Password",text: $password )
                                
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
                    
                    // Error Message
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundStyle(Color.fundo)
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Button(action: {
                        goToLogin = true
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
                    
                    NavigationLink(destination: LoginScreen(), isActive: $goToLogin) {
                        EmptyView()
                    }
                }
                .padding()
            }
        }
    }
    
    // func for create User and save the date on Firebase
    func createUser() {
        
        if password.isEmpty || password != password {
            errorMessage = "Password do not match"
            return
        }
        
        // Create the user on Firebase Authentication
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = "Error \(error.localizedDescription)"
                return
            }
            
            // Saving the additional data in Firestore
            
            let db = Firestore.firestore()
            let userData = [
                "name": name,
                "email": email,
                "address": address,
                "post": post,
                "city": city,
                "country": country,
                "phoneNumber": phoneNumber
            ]
            
            db.collection("User").document(result!.user.uid).setData(userData) { error in
                if let error = error {
                    errorMessage = "Failed to save user data: \(error.localizedDescription)"
                } else {
                    // Seccesfull
                    goToLogin = true
                }
                
            }
            
        }
    }
}


#Preview {
    SignUpView()
}
