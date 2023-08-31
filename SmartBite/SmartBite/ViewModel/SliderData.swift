//
//  SliderData.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/17.
//

import Foundation

class SliderData: ObservableObject {
    
    @Published var calorieValue: Double = 0.0
    @Published var proteinValue: Double = 0.0
    @Published var carbsValue: Double = 0.0
    @Published var fatValue: Double = 0.0
    
}
