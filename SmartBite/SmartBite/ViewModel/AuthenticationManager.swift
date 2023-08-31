//
//  AuthenticationManager.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/03.
//

import Foundation
import FirebaseAuth

//class AuthenticationManager: ObservableObject {
//    
//    func createUser(email: String, password: String) async throws  -> User {
//        
//        let authResultData = try await Auth.auth().createUser(withEmail: email, password: password)
//        let userData = User(email: authResultData.user.email,
//                            photoURl: authResultData.user.photoURL?.absoluteString)
//        return userData
//    }
//    func loginUser(email: String, password: String) async throws -> User {
//        
//        let authResultData = try await Auth.auth().signIn(withEmail: email, password: password)
//        
//        let userData = User(email: authResultData.user.email,
//                            photoURl: authResultData.user.photoURL?.absoluteString)
//        return userData
//
//        }
//    }

