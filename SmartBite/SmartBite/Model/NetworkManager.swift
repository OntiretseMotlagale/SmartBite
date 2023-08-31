//
//  NetworkManager.swift
//  SmartBite
//
//  Created by Ontiretse Motlagale on 2023/07/04.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var foodDataList: Food?
    
    @Published var searchData: [Hint] = []
    @Published var imageURL: [String] = []
    @Published var hint: [Hint] = []
    
    func fetchData(foodName: String) {
       let urlString = "https://api.edamam.com/api/food-database/v2/parser?app_key=1e0d08c319ea0c5cae830e16dcce126b&app_id=15cf76ba&ingr=\(foodName)"
        
        guard let url = URL(string: urlString) else {return}
        
        guard !foodName.isEmpty, searchData.isEmpty else {
                    return
        }
        
        let request = URLRequest(url: url, timeoutInterval: 5)
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            request.debug(with: data)
            guard let safeData = data, error == nil else {return}
            
            do {
                let safeFoodData = try JSONDecoder().decode(Food.self, from: safeData)
        
                DispatchQueue.main.async {
                    
                    self?.foodDataList = safeFoodData
                    
                    self?.hint = self?.foodDataList?.hints ?? []
                    self?.searchData = self?.foodDataList?.hints ?? []
                }

            } catch  {
                print(error)
            }
         }
        task.resume()
    }
}
