//
//  Food.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/04.
//

import Foundation

// MARK: - Welcome
struct Food: Codable {
    let text: String?
    let parsed: [Parsed]?
    let hints: [Hint]?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case text, parsed, hints
        case links = "_links"
    }
}
// MARK: - Hint
struct Hint: Codable, Identifiable {
    var id = UUID()
    let food: HintFood?
    let measures: [Measure]?
    
    enum CodingKeys: String, CodingKey {
        case food, measures
    }
}

// MARK: - HintFood
struct HintFood: Codable {
    let foodID, label, knownAs: String?
    let nutrients: Nutrients?
    let category: Category?
    let categoryLabel: CategoryLabel?
    let image: String?
    let brand, foodContentsLabel: String?
    let servingSizes: [ServingSize]?
    let servingsPerContainer: Double?

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case label, knownAs, nutrients, category, categoryLabel, image, brand, foodContentsLabel, servingSizes, servingsPerContainer
    }
}

enum Category: String, Codable {
    case genericFoods = "Generic foods"
    case genericMeals = "Generic meals"
    case packagedFoods = "Packaged foods"
}

enum CategoryLabel: String, Codable {
    case food = "food"
    case meal = "meal"
}

// MARK: - Nutrients
struct Nutrients: Codable {
    let enercKcal, procnt, fat, chocdf: Double?
    let fibtg: Double?

    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procnt = "PROCNT"
        case fat = "FAT"
        case chocdf = "CHOCDF"
        case fibtg = "FIBTG"
    }
}

// MARK: - ServingSize
struct ServingSize: Codable {
    let uri: String?
    let label: String?
    let quantity: Double?
}

// MARK: - Measure
struct Measure: Codable {
    let uri: String?
    let label: String?
    let weight: Double?
}

// MARK: - Links
struct Links: Codable {
    let next: Next?
}

// MARK: - Next
struct Next: Codable {
    let title: String?
    let href: String?
}

// MARK: - Parsed
struct Parsed: Codable {
    let food: ParsedFood?
}

// MARK: - ParsedFood
struct ParsedFood: Codable {
    let foodID, label, knownAs: String?
    let nutrients: Nutrients?
    let category: Category?
    let categoryLabel: CategoryLabel?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case foodID = "foodId"
        case label, knownAs, nutrients, category, categoryLabel, image
    }
}
