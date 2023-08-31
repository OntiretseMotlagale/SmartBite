//
//  Task.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/20.
//
import Foundation

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
    var image: String
    
    var calories: Double
    var fat: Double
    var protein: Double
    var carbs: Double
}
    struct TaskMetaData {
        var id = UUID().uuidString
        var task: [Task]
        var taskDate: Date
    
}
func getSampleDate(offSet: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offSet, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        
        Task(title: "Apple", image: "apples",
             calories: 243, fat: 231, protein: 29, carbs: 10),
        
        Task(title: "Eggs", image: "eggs",
             calories: 490 , fat: 211, protein: 140, carbs: 95),
        
        Task(title: "Bacon", image: "bacon",
             calories: 601 ,fat : 198, protein: 25, carbs: 78)
        
    ], taskDate: getSampleDate(offSet: 0)),
    
    TaskMetaData(task: [
        Task(title: "Beef", image: "beef",
             calories: 737 , fat: 78, protein: 131, carbs: 56),
        Task(title: "Cookies", image: "cookies", calories: 205, fat: 134, protein: 0, carbs: 12)
    ], taskDate: getSampleDate(offSet: -3)),
    
    TaskMetaData(task: [
        Task(title: "Butter", image: "butter",
             calories: 572 , fat: 451, protein: 23, carbs: 95)
    ], taskDate: getSampleDate(offSet: 8)),
    
    TaskMetaData(task: [
        Task(title: "Milk", image: "milk", calories: 189 , fat: 231, protein: 29, carbs: 10)
    ], taskDate: getSampleDate(offSet: 10)),
    
    TaskMetaData(task: [
        Task(title: "Bread", image: "bread", calories: 450 , fat: 231, protein: 29, carbs: 10)
    ], taskDate: getSampleDate(offSet: -22)),
    
    TaskMetaData(task: [
        Task(title: "Coffee", image: "coffee", calories: 333 , fat: 231, protein: 29, carbs: 10)
    ], taskDate: getSampleDate(offSet: 24))
    
]
    
    


