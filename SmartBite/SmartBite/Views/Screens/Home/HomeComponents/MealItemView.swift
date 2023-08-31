//
//  MealItemView.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/18.
//

import SwiftUI

struct MealItemView: View {
    var foodItem: Hint
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: String((foodItem.food?.image) ?? "No Image"))) { image in
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .padding()
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .padding()
            }
            VStack (alignment: .leading) {
                Text(foodItem.food?.label ?? "No Label")
                    .fontWeight(.bold)
            }
            Spacer()
            VStack {
                Text("Calories")
                    .font(.headline)
                Text(String(ceil(foodItem.food?.nutrients?.enercKcal ?? 0)))
            }
        }
    }
}
//struct MealItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealItemView(foodItem: Hint)
//    }
//}
