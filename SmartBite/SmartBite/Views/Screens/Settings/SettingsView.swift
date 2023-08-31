
//  Created by Ontiretse Motlagale on 2023/07/05.
//
// SettingsView.swift
// SmartBite
//
// Created by Teboho Mohale on 2023/07/05.
//
import SwiftUI

struct SettingsView: View {
    @ObservedObject var sliderData: SliderData
    @AppStorage("uid") var loginScreen: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Your Daily Goal")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    VStack(spacing: 30) {
                        SliderRow(value: $sliderData.calorieValue, title: "Calories", color: .red)
                        SliderRow(value: $sliderData.proteinValue, title: "Protein", color: .green)
                        SliderRow(value: $sliderData.carbsValue, title: "Carbs", color: .blue)
                        SliderRow(value: $sliderData.fatValue, title: "Fat", color: .yellow)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 10, y: 10)
                    .padding(.horizontal)
                    
                    Button(action: {
                        withAnimation {
                            self.loginScreen = ""
                        }
                    }) {
                        Label("Sign Out", systemImage: "lock.open.fill")
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top, 80)
                }
                .padding(.top, 5)
                .navigationTitle("Settings")
                .navigationBarBackButtonHidden(true)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
