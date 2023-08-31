//
//  FoodSearchView.swift
//  SmartBite
//
//  Created by Joewe Khosa on 2023/07/04.
//

import SwiftUI

struct SearchForFoodView: View {
    @State private var searchText = ""
    
    let names = ["Spinach", "Eggs", "Cookies", "Steak", "Bunny Chaw"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .overlay {
                if searchResults.isEmpty {
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                        Text("No results")
                            .font(.system(size: 30, weight: .semibold))
                        Text("Search for available food items via the search bar above")
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    }.opacity(0.5)
                }
            }
            .navigationTitle("Menu")
        }
        .searchable(text: $searchText, prompt: "Find Food")
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { 
                $0.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
}

struct SearchForFoodView_Previews: PreviewProvider {
    static var previews: some View {
        SearchForFoodView()
    }
}

