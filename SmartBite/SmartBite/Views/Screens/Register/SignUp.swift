//
//  Login.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/06/26.
//

import SwiftUI
import FirebaseAuth

struct SignUp: View {
    
    @State var fullName = ""
    @Binding var currentScreen: String
    @StateObject var viewModel = Authentication()
    
    var body: some View {
        VStack {
            VStack {
                Image("smartBite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 80)
                    .cornerRadius(20)
                
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
            }
            VStack(spacing: 20) {
                Text("Looks like you already have an account. Please Login.")
                    .lineLimit(2)
                
                UserInput(text: $fullName, name: "Full Name", icon: "person")
                UserInput(text: $viewModel.email, name: "Email", icon: "person")
                UserInputSecure(text: $viewModel.password, name: "Password", icon: "lock")

                Button(action: {
                    withAnimation {
                    self.currentScreen = "Login"
                    }
                }){
                    Text("Already have an account ?")
                        .foregroundColor(.gray)
                }
                Text("By selecting Agree and continue below, agree to") + Text(" Terms of Service and Privacy Policy")
                    .bold()
                    .foregroundColor(Color("primaryColor"))
                    
                Button(action: {

                    viewModel.registerUser()
                    clearTextFields()
                }){
                    Text("Create Account")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("primaryColor"))
                )
            }
            .padding()
        }
    }
    func clearTextFields() {
        fullName = ""
           viewModel.email = ""
           viewModel.password = ""
       }
}

struct UserInput: View {
    
    @Binding var text: String
    var name: String
    var icon = ""
    var body: some View {
        HStack {
            Image(systemName: icon)
            TextField(name, text: $text)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("primaryColor"), lineWidth: 3))
        .padding(.horizontal)
    }
}
struct UserInputSecure: View {
    
    @Binding var text: String
    @StateObject var viewModel = Authentication()
    @State private var isPasswordVisible = false
    var name: String
    var icon = ""
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            if isPasswordVisible {
                TextField("Password", text: $viewModel.password)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
            } else {
                SecureField("Password", text: $viewModel.password)
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
                .stroke(Color("primaryColor"), lineWidth: 3))
        .padding(.horizontal)
    }
}
