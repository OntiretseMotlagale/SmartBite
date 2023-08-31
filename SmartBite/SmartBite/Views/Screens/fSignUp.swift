//
//  Login.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/06/26.
//

import SwiftUI

struct SignUp: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var fullName: String = ""

    
//    @Binding var currentScreen: String
    
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
                    
                    UserInput(text: fullName, name: "Full Name", icon: "person")
                    UserInput(text: email, name: "Email", icon: "mail")
                    UserInput(text: password, name: "Password", icon: "lock")
                    
                    Button(action: {
                        withAnimation {
//                            self.currentScreen = "Login"
                        }
                    }){
                        Text("Already have an account ?")
                            .foregroundColor(.gray)
                    }
                    Text("By selecting Agree and continue below, agree to") + Text(" Terms of Service and Privacy Policy")
                        .bold()
                        .foregroundColor(Color("primaryColor"))
                    Button(action: {}){
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
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

struct UserInput: View {
    
    @State var text: String
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
