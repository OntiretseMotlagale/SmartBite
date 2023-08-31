//
//  Meal.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/06/27.
//

import SwiftUI

struct Meal: View {
    
    var imageName: String
    var mealName: String
//    var caloryNumber: Int
    var mealIconColor: Color
    
    @Binding var selectedFoods: [Hint]
    @StateObject var sliderData = SliderData()
    
    var body: some View {
        
        VStack {
            HStack (spacing: 10) {
                Image(systemName: imageName)
                    .font(.system(size: 40))
                    .foregroundColor(mealIconColor)
                
                VStack (alignment: .leading, spacing: 5 ) {
                    Text(mealName)
                        .font(.title2)
                        .fontWeight(.bold)
//                    Text("Goal: \(caloryNumber) Calories")
                        .font(.body)
                        .foregroundColor(Color.gray.opacity(0.9))
                }
                Spacer()
                
                NavigationLink(destination: SearchBarView(foodItems: $selectedFoods)){
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color(.black))
                }
            }
            Divider()
                .frame(height: 2)
                .overlay(
                    Color.gray.opacity(0.4))
            
            HStack (spacing: 30) {
                VStack (alignment: .center) {
                    Text("Calories")
                        .foregroundColor(.gray)
                    Text(String (calculateCalories()))
                }
                VStack (alignment:.center) {
                    Text("Protein")
                        .foregroundColor(.gray)
                    Text(String (calculateProtein()))
                }
                VStack (alignment:.center) {
                    Text("Carbs")
                        .foregroundColor(.gray)
                    Text(String (calculateCarbs()))
                }
                VStack (alignment:.center) {
                    Text("Fat")
                        .foregroundColor(.gray)
                    Text(String (calculateFat()))
                }
            }
            Divider()
                .frame(height: 2)
                .overlay(
                    Color.gray.opacity(0.4))
            
            
            LazyVStack (alignment: .leading){
                
                ForEach(selectedFoods, id: \.id) { selectedFood in

                    HStack (spacing: 20){
                        MealItemView(foodItem: selectedFood)
                        
                        Button {
                            deleteMeal(index: 0)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                      }
                    }
                }
            }
        }
        .padding()
        .frame(width: 390)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
        .padding()
       }
    
    func deleteMeal(index: Int) {
        selectedFoods.remove(at: index)
    }
    
    func calculateCalories() -> Double {
        var total = 0.0
        for selectedFood in selectedFoods {
            total += selectedFood.food?.nutrients?.enercKcal ?? 0
        }
        return ceil(total)
    }
    
    func calculateFat() -> Double {
        var total = 0.0
        for selectedFood in selectedFoods {
            total += selectedFood.food?.nutrients?.fat ?? 0
        }
        return ceil(total)
    }
    func calculateCarbs() -> Double {
        var total = 0.0
        
        for selectedFood in selectedFoods {
            total += selectedFood.food?.nutrients?.chocdf ?? 0
        }
        return ceil(total)
    }
    func calculateProtein() -> Double {
        var total = 0.0
        
        for selectedFood in selectedFoods {
            total += selectedFood.food?.nutrients?.procnt ?? 0
        }
        return ceil(total)
    }
}


struct Meal_Previews: PreviewProvider {

    static var previews: some View {
        Meal(imageName: "sun.and.horizon", mealName: "Breakfast", mealIconColor: .green, selectedFoods: .constant([]))
            .previewLayout(.sizeThatFits)
    }
}
