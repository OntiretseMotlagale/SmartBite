//
//  PopUpView.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/21.
//

import SwiftUI

struct PopUpView: View {
    @Binding var isShowPopup: Bool
    var text: String = ""
    var iconName: String = ""
    var reminder: String = ""
    var iconColor: Color
    
    var body: some View {
        
        ZStack {
            ZStack {
                Color.black.opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                VisualEffectView(effect: UIBlurEffect(style: .systemThickMaterial))
                    .frame(width: 350, height: 400)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.vertical, 50)
                VStack (spacing: 25) {
                    
                    VStack (spacing: 30) {
                        Image(systemName: iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(iconColor)
                        
                        Text(text)
                            .font(.title)
                            .fontWeight(.black)
                        
                        Text(reminder)
                            .padding(.horizontal, 40)
                            .font(.headline)
                    }
                    VStack {
                        Button {
                            isShowPopup = false
                        } label: {
                            Text("OK")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 50, height: 50)
                                .background(Color.green.opacity(0.8))
                                .cornerRadius(50)
                        }
                    }
                    
                }
                Spacer()
            }
        }
    }
    struct VisualEffectView: UIViewRepresentable {
        var effect: UIVisualEffect?
        
        func makeUIView(context: Context) -> UIVisualEffectView {
            UIVisualEffectView()
        }
        
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            uiView.effect = effect
        }
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(isShowPopup: .constant(true), text: "STOP!", iconName: "xmark.circle.fill",reminder: "You have exceeded your daily limit", iconColor: .red)
        
    }
}
