//
//  Sheet.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/06.
//

import SwiftUI

struct Sheet: View {
    var selectedFood: Hint?
    var buttonAction: () -> Void
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
  
    @State private var progressValues: [Float] = [0.0, 0.0, 0.0, 0.0]
    @State private var date = Date()
    @State private var showPopUp = false
    @State private var isSheetDismissed = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                AsyncImage(url: URL(string: String((selectedFood?.food?.image) ?? "No Image")) ) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding()
                }
                
                VStack {
                    Text((selectedFood?.food?.label) ?? "No Label")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                HStack {
                    VStack {
                        Text("Calories")
                        ZStack {
                            ProgressBar(progress: self.$progressValues[0], color: .red)
                                .frame(width: 60.0, height: 100.0)
                                .padding()
                                .onAppear {
                                    if let calories = selectedFood?.food?.nutrients?.enercKcal {
                                        self.progressValues[0] = Float(calories / 1000)
                                    }
                                }
                            Text("\(Int(self.progressValues[0] * 100))")
                        }
                    }
                    VStack {
                        Text("Protein")
                        ZStack {
                            ProgressBar(progress: self.$progressValues[1], color: .green)
                                .frame(width: 60.0, height: 100.0)
                                .padding()
                                .onAppear {
                                    if let protein = selectedFood?.food?.nutrients?.procnt {
                                        self.progressValues[1] = Float(protein / 100)
                                    }
                                }
                            Text("\(Int(self.progressValues[1] * 100))")
                        }
                    }
                    
                    VStack {
                        Text("Carbs")
                        ZStack {
                            ProgressBar(progress: self.$progressValues[2], color: .purple)
                                .frame(width: 60.0, height: 100.0)
                                .padding()
                                .onAppear {
                                    if let carbs = selectedFood?.food?.nutrients?.chocdf {
                                        self.progressValues[2] = Float(carbs / 100)
                                    }
                                }
                            Text("\(Int(self.progressValues[2] * 100))")
                        }
                    }
                    
                    VStack {
                        Text("Fat")
                        ZStack {
                            ProgressBar(progress: self.$progressValues[3], color: .yellow)
                                .frame(width: 60.0, height: 100.0)
                                .padding()
                                .onAppear {
                                    if let fat = selectedFood?.food?.nutrients?.fat {
                                        self.progressValues[3] = Float(fat / 100)
                                    }
                                }
                            Text("\(Int(self.progressValues[3] * 100))")
                        }
                    }
                }
                DatePicker("Date & Time", selection: $date)
                    .font(.title)
                    .padding()
                Spacer()
                
                Button(action: {
                    buttonAction()
            
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
                        showPopUp = true
                        dismissSheet()
                    }
                    
                }) {
                    ZStack {
                        HStack {
                            Text("Add Item")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                }
            }
            .onAppear {
                if let calories = selectedFood?.food?.nutrients?.enercKcal {
                    self.progressValues[0] = ceil(Float(calories / 1000))
                }
                if let protein = selectedFood?.food?.nutrients?.procnt {
                    self.progressValues[1] = ceil(Float(protein / 100))
                }
                if let carbs = selectedFood?.food?.nutrients?.chocdf {
                    self.progressValues[2] = ceil(Float(carbs / 100))
                }
                if let fat = selectedFood?.food?.nutrients?.fat {
                    self.progressValues[3] = ceil(Float(fat / 100))
                }
            }
            .presentationDetents([.fraction(5.00)])
            .presentationDragIndicator(.visible)
  
            popUpView
        }
    }
    
    
    private func dismissSheet() {
        presentationMode.wrappedValue.dismiss()
        isSheetDismissed = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
            showPopUp = false
        }
    }
    
    @ViewBuilder
        private var popUpView: some View {
            if showPopUp && !isSheetDismissed {
                ZStack {
                    Color.white
                    VStack {
                        Image(systemName: "fork.knife")
                            .font(.system(size: 50))
                            .foregroundColor(.black)

                        Text("Submitted")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Food Item has been saved")
                    }
                    .padding()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .shadow(radius: 20)
                .background(Color.black)
            }
        }
    }


//struct Sheet_Previews: PreviewProvider {
// 
//    static var previews: some View {
//        Sheet(selectedFood: .constant(Hint))
//    }
//}
