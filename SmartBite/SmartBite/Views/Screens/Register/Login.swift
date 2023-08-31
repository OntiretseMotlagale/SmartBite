//
//  Login.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/06/26.
//

import SwiftUI
import FirebaseAuth

struct Login: View {
    
    @Binding var currentScreen: String
    @StateObject var authenticationViewModel = Authentication()
    @AppStorage("uid") var loginScreen: String = ""
    @State private var isPasswordVisible = false
   
    var body: some View {
        VStack {
            
            HStack {
                Text("Welcome Back, Sign In.")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            VStack(spacing: 20) {
                
                Text("You have created an account please log in. ")
                    .lineLimit(2, reservesSpace: true)
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $authenticationViewModel.email)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primaryColor"), lineWidth: 2))
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "lock")
                    if isPasswordVisible {
                        TextField("Password", text: $authenticationViewModel.password)
                            .keyboardType(.asciiCapable)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    } else {
                        SecureField("Password", text: $authenticationViewModel.password)
                            .keyboardType(.asciiCapable)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(isPasswordVisible ? .gray : .green)
                    }
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primaryColor"), lineWidth: 2))
                .padding(.horizontal)
                
                Button(action: {
                    withAnimation {
                        self.currentScreen = "SignUp"
                    }
                }){
                    Text("Create an account ?")
                        .foregroundColor(.gray)
                }
                Button(action: {
                    authenticationViewModel.loginUser()
                    self.loginScreen = authenticationViewModel.email
                    
                }){
                    Text("Login")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("primaryColor")))
            }
            .padding()
        }
    }
}


