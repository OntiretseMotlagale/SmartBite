//
//  progrerssViewSimple.swift
//  SmartBite
//
//  Created by Joewe Khosa on 2023/06/27.
//

import SwiftUI

struct progrerssViewSimple: View {
    @State var value = 0.0
    @State var total = 100
    
    var body: some View{
        VStack{
            ProgressView("Downloading…", value: value, total: Double(total))
                .padding()
            Button(action: {
                value += 10
                if total == 100{
                    Text("you have reached your limit")
                }
            }) {
            Text("Submit")
            }
        }
    }
    
}
struct progrerssViewSimple_Previews: PreviewProvider {
    static var previews: some View {
        progrerssViewSimple()
    }
}
