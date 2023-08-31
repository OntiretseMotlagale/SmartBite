//
//  progressBar.swift
//  SmartBite
//
//  Created by Joewe Khosa on 2023/06/27.
//

import SwiftUI

struct progressBar: View {
    @State var value = 0.0
    @State var total = 100
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var color1 = Color(#colorLiteral(red: 0, green: 0.7807869315, blue: 0.7398603559, alpha: 1))
    var color2 = Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    
    var body: some View{
        let multiplier = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame().frame(width: percent * multiplier, height: height)
                .background(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                .foregroundColor(.clear)
        }
    }
}

struct progressBar_Previews: PreviewProvider {
    static var previews: some View {
        progressBar()
    }
}
