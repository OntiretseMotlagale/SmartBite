//
//  MealHistory.swift
//  SmartBite
//
//  Created by Teboho Mohale on 2023/07/17.
//

import SwiftUI

struct MealHistory: View {
    @State private var breakfastMeals: [MealEntry] = []
    @State private var lunchMeals: [MealEntry] = []
    @State private var dinnerMeals: [MealEntry] = []
    
    var body: some View {
        VStack {
            Section(header: Text("Breakfast").foregroundColor(.blue)) {
                ForEach(breakfastMeals) { meal in
                    MealEntryView(meal: meal)
                }
            }
            Section(header: Text("Lunch").foregroundColor(.green)) {
                ForEach(lunchMeals) { meal in
                    MealEntryView(meal: meal)
                }
            }
            Section(header: Text("Dinner").foregroundColor(.orange)) {
                ForEach(dinnerMeals) { meal in
                    MealEntryView(meal: meal)
                }
            }
        }
        .padding()
    }
    
    func addMeal(_ meal: MealEntry) {
        switch meal.mealType {
        case .breakfast:
            breakfastMeals.append(meal)
        case .lunch:
            lunchMeals.append(meal)
        case .dinner:
            dinnerMeals.append(meal)
        }
    }
}

struct MealEntry: Identifiable {
    let id = UUID()
    let mealType: MealType
    let foods: [Hint]
}

enum MealType {
    case breakfast
    case lunch
    case dinner
}

struct MealEntryView: View {
    let meal: MealEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(meal.mealType.title)
                .font(.headline)
            
            ForEach(meal.foods) { food in
                Text(food.food?.label ?? "")
            }
            
            Divider()
        }
    }
}

extension MealType {
    var title: String {
        switch self {
        case .breakfast:
            return "Breakfast"
        case .lunch:
            return "Lunch"
        case .dinner:
            return "Dinner"
        }
    }
}


struct MealHistory_Previews: PreviewProvider {
    static var previews: some View {
        MealHistory()
    }
}
