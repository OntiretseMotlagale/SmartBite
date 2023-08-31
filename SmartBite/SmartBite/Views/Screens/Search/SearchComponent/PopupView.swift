////
////  PopupView.swift
////  SmartBite
////
////  Created by Teboho Mohale on 2023/07/19.
////
//
//import SwiftUI
//
//struct PopupView<Content: View>: View {
//    let content: Content
//    @Binding var isPresented: Bool
//    let duration: TimeInterval
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Color.black.opacity(0.4)
//                    .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    content
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(radius: 5)
//
//                    Spacer()
//                }
//            }
//            .opacity(isPresented ? 1 : 0)
//            .animation(.easeInOut(duration: 0.25))
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//                    withAnimation {
//                        isPresented = false
//                    }
//                }
//            }
//        }
//    }
//}
//
////
////struct PopupView_Previews: PreviewProvider {
////    static var previews: some View {
////        PopupView()
////    }
////}
