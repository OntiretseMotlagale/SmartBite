//
//  SearchForFood.swift
//  SmartBite
//
//  Created by Joewe Khosa on 2023/06/30.
//

//import SwiftUI
//
//struct SearchForFoodView: View {
//    let names = ["Holly", "Josh", "Rhonda", "Ted"]
//    @State private var searchText = ""
//    var body: some View {
//        NavigationStack{
//            List {
//                ForEach(searchResults, id: \.self) { name in
//                    NavigationLink {
//                        Text(name)
//                    } label: {
//                        Text(name)
//                    }
//                }
//            }
//
//            Text("Searching for \(searchText)")
//                .navigationTitle("Searchable Example")
//        }
//
//        .searchable(text: $searchText, prompt: "Looking for food")
//
//
//    }
//}
//
//struct SearchForFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchForFoodView()
//    }
//}
import SwiftUI

struct SearchForFoodView: View {

    @State private var searchText = ""
    
    let names = ["Holly", "Josh", "Rhonda", "Ted", "James"]

    var body: some View {
        NavigationStack {
            List {
                if searchResults.isEmpty {
                    Text("No results found")
                } else {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
        .searchable(text: $searchText)
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct SearchForFoodView_Previews: PreviewProvider {
    static var previews: some View {
        SearchForFoodView()
    }
}
