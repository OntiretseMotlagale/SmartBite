//
//  HomeView.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/06/27.
//

import SwiftUI

struct HomeView: View {
    
    //  @EnvironmentObject var sliderData: SliderData
    @StateObject var sliderData = SliderData()
    @State var currentDate: Date = Date()
    
    @State var showPopup: Bool = false
    @State var exceedPopUp: Bool = false
    @State private var isCalendarPresented = false
    
    @State var selectedFood: Hint?
    
    @State var breakfastFoods: [Hint] = []
    @State var lunchFoods: [Hint] = []
    @State var dinnerFoods: [Hint] = []
    
    @AppStorage("calories") var calories: Double = 0
    
    
    var body: some View  {
        ZStack {
            NavigationView {
                VStack {
                    VStack {
                        MealDate()
                    }
                    HStack {
                        ProgressCircle(breakfastFoods: $breakfastFoods)
                            .frame(width: 140)
                        
                        VStack (spacing: 9) {
                            
                            MealProgressBar(color: .red,
                                            barColor: .red,
                                            nutrientName: "Calories",
                                            nutrient: selectedFood?.food?.nutrients?.enercKcal ?? 0.0,
                                            totalNutrient: sliderData.calorieValue,
                                            value: calculateCalories())
                            
                            MealProgressBar(color: .green,
                                            barColor: .green,
                                            nutrientName: "Protein",
                                            nutrient: selectedFood?.food?.nutrients?.procnt ?? 0.0,
                                            totalNutrient: sliderData.proteinValue,
                                            value: calculateProtein())
                            
                            MealProgressBar(color: .purple,
                                            barColor: .purple,
                                            nutrientName: "Carbs",
                                            nutrient: selectedFood?.food?.nutrients?.chocdf ?? 0.0,
                                            totalNutrient: sliderData.carbsValue,
                                            value: calculateCarbs())
                            
                            MealProgressBar(color: .yellow,
                                            barColor: .yellow,
                                            nutrientName: "Fat",
                                            nutrient: selectedFood?.food?.nutrients?.fat ?? 0.0,
                                            totalNutrient: sliderData.fatValue,
                                            value: calculateFat())
                            
                        }
                        Spacer()
                        
                    }
                    
                    ScrollView {
                        VStack (alignment: .leading) {
                            Meal(imageName: "sun.and.horizon",
                                 mealName: "Breakfast",
                                 
                                 mealIconColor: .orange,
                                 selectedFoods: $breakfastFoods)
                            
                            Meal(imageName: "sun.min",
                                 mealName: "Lunch",
                                 
                                 mealIconColor: .blue,
                                 selectedFoods: $lunchFoods)
                            
                            Meal(imageName: "moon.zzz.fill",
                                 mealName: "Dinner",
                                 
                                 mealIconColor: .purple,
                                 selectedFoods: $dinnerFoods)
                        }
                    }
                }
                .overlay {
                    if showPopup {
                        ZStack {
                            PopUpView(isShowPopup: $showPopup, text: "Warning!", iconName: "exclamationmark.triangle.fill",reminder: "You have consumed 80% if your daily limit, you have +- 20% left of your daily limit.", iconColor: .yellow.opacity(0.7))
                            
                        }
                    }
                    else if exceedPopUp {
                        
                        ZStack {
                            PopUpView(isShowPopup: $exceedPopUp, text: "STOP!", iconName: "xmark.circle.fill",reminder: "You have exceeded your daily limit !!", iconColor: .red)
                            
                        }
                        
                    }
                }
                .navigationBarItems(
                    leading: HStack {
                        Text("Today")
                            .font(.largeTitle)
                            .bold()
                    },
                    trailing: HStack {
                        Button(action: {}) {
                            NavigationLink(destination: CustomDatePicker(currentDate: $currentDate)) {
                                Image(systemName: "calendar")
                                    .foregroundColor(.gray)
                            }
                        }
                        Button(action: {}){
                            NavigationLink(destination: SettingsView(sliderData: sliderData)){
                                Image(systemName: "gearshape")
                            }
                        }
                        .foregroundColor(.gray)
                    })
            }
            .onChange(of: calculateCalories()) { _ in
                exceedLimit()
            }
        }
        
        .onChange(of: calculateCalories()) { _ in
            calculatePercentage()
        }
        
    }
    func exceedLimit() {
        if (Double(calculateCalories()) / Double(sliderData.calorieValue) * 100) > 100 {
            exceedPopUp = true
        }
    }
    func calculatePercentage() {
        if (Double(calculateCalories()) / Double(sliderData.calorieValue) * 100) >= 80
            &&
            (Double(calculateCalories()) / Double(sliderData.calorieValue) * 100) < 100
        {
            showPopup = true
        }
    }
    
    func calculateCalories() -> Double {
        var total = 0.0
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.enercKcal ?? 0
        }
        return ceil(total)
    }
    
    func calculateFat() -> Double {
        var total = 0.0
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.fat ?? 0
        }
        return ceil(total)
    }
    func calculateCarbs() -> Double {
        var total = 0.0
        
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.chocdf ?? 0
        }
        return ceil(total)
    }
    func calculateProtein() -> Double {
        var total = 0.0
        
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.procnt ?? 0
        }
        return ceil(total)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
