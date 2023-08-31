//
//  MealProgressBar.swift
//  SmartBite
//
//  Created by Joewe Khosa on 2023/06/28.
//

import SwiftUI

struct MealProgressBar: View {
    
    var color: Color
    var barColor: Color
    var nutrientName: String
    var nutrient = 0.0
    var totalNutrient = 10.0
    var value: Double = 0.0

    @State var showAlert = false
    
    var body: some View {
        
        VStack (alignment: .leading){
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .frame(width: 20, height: 20)
                Text(nutrientName)
                    .font(.footnote)
                    .fontWeight(.heavy)
                Spacer()
                HStack {
                    Text("\(value, specifier: "%.0f") / \(totalNutrient, specifier: "%.0f")")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            }.padding(.horizontal)
            
            VStack{
                if totalNutrient == 0 {
                    ProgressView( value: 0)
                        .accentColor(barColor)
                        .scaleEffect(y: 2)
                }
                else {
                    ProgressView(value: value, total: totalNutrient)
                        .tint(barColor)
                        .scaleEffect(y: 2)
                }
                
            }.padding(.horizontal)
           
            
        }.padding(.horizontal)
    }
    
}





struct MealProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        MealProgressBar(color: .blue, barColor: .blue, nutrientName: "Calories")
    }
}


