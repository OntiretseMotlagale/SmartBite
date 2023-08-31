//
//  AuthenticationView.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/04.
//

import SwiftUI

struct AuthenticationView: View {
    @State var currentScreen = "Login"
    
    var body: some View {
        
        if currentScreen == "Login" {
            Login( currentScreen: $currentScreen)
                .transition(.move(edge: .bottom))

        }
        else if currentScreen == "SignUp" {
            SignUp( currentScreen: $currentScreen)
                .transition(.move(edge: .top))
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
