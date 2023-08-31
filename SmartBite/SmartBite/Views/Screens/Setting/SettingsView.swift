//
//  SettingsView.swift
//  SmartBite
//
//  Created by Teboho Mohale on 2023/07/05.
//

import SwiftUI

struct SettingsView: View {
    @State private var sliderValue1: Double = .zero
    @State private var sliderValue2: Double = .zero
    @State private var sliderValue3: Double = .zero
    @State private var sliderValue4: Double = .zero
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 200) {
                ScrollView {
                    
                    VStack {
                        SliderRow(title: "Calories", value: $sliderValue1, color: .red)
                        SliderRow(title: "Protein", value: $sliderValue2, color: .green)
                        SliderRow(title: "Carbs", value: $sliderValue3, color: .blue)
                        SliderRow(title: "Fat", value: $sliderValue4, color: .yellow)
                        
                        
                        }
                    .padding()
                    .frame(width: 400, height: 300)
                    .background(Color.white)
                    .cornerRadius(40)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                
                    }
                    
                Button(action: {}) {
                    Text("Sign Out")
                        .padding()
                     
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray)
                        )
                    
                }
//                .frame(width: .)
            }
            .padding()
            .navigationTitle("Settings")
            .navigationBarBackButtonHidden(true)
        }
    }
    

}

struct SliderRow: View {
    let title: String
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        VStack {
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .frame(width: 20, height: 20)
                Text(title)
                Spacer()
                Text("\(value, specifier: "%.0f")")

                                   .foregroundColor(.blue)
                .padding(.horizontal)
            }
            Slider(value: $value, in: 0...1000, step: 1, onEditingChanged: { editing in
            })
            .accentColor(color)
            
        }.padding(.horizontal)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
