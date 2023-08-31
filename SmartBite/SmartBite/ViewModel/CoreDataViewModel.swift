//
//  CoreDataViewModel.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/17.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataViewModel: ObservableObject {
    
   static let shared = CoreDataViewModel()
   let container = NSPersistentContainer(name: "MealContainer")

    @Published var mealData: [MealEntity] = []

    init() {
        container.loadPersistentStores { _ , error in
            if let unwrappedError = error {
                print("Storage Could Not Load \(unwrappedError)")
            }
            else {
                print("Storage Successfully Loaded")
            }
        }
    }
    func fetchMeal() {
        let request = NSFetchRequest<MealEntity>(entityName: "MealEntity")

        do {
            mealData = try container.viewContext.fetch(request)
        }
        catch {
            print("Fetching Meals Faile \(error)")
        }
    }
    
    func addMeal(calories: Double,
                 protein: Double,
                 fat: Double,
                 carbs: Double) {

        let newMeal = MealEntity(context: container.viewContext)

        newMeal.mealProtein = protein
        newMeal.mealCarbs = carbs
        newMeal.mealFat = fat
        newMeal.mealCalories = calories
        
        saveMeal()
    }

    func saveMeal() {
        do {
            try container.viewContext.save()
        }
        catch {
            print("Failed To Save Meal \(error)")
        }
    }
}
