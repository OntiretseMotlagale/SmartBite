//
//  BottomSheet.swift
//  SmartBite
//
//  Created by Teboho Mohale on 2023/07/05.
//

import SwiftUI

struct BottomSheet: View {
//    let food: String
    @State private var food = ""
    
    var body: some View {
        VStack {
            Text("Selected Food:")
                .font(.headline)
                .padding()
            Text(food)
                .padding()
            Spacer()
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
