//
//  ContentView.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/06/26.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    
    @AppStorage("uid") var loginScreen = ""
    
    var body: some View {
       
        if loginScreen == "" {
            AuthenticationView()
                .transition(.move(edge: .top))
        }
        else {
            HomeView()
                .transition(.move(edge: .top))

         }

        }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
