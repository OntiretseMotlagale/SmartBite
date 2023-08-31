//
//  Authentication.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/03.
//

import Foundation
import FirebaseAuth

class Authentication: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginScreen: String = ""
    
    func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
            }
            if let unwrappedAuthResult = authResult {
                self.loginScreen = unwrappedAuthResult.user.uid
            }
        }
    }
    
    func loginUser() {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print(error)
            }
            if let unwrappedAuthResult = authResult {
                self.loginScreen = unwrappedAuthResult.user.uid
            }
        }
    }
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
