//
//  RestAPIServices.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation

class RestAPIServices {
    static let shared = RestAPIServices()
    
    func fetchDessertData() async throws -> [Dessert] {
        
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            throw URLError(.badURL)
        }
        
        let (fetchedData, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let dessertsResponse = try JSONDecoder().decode(DessertResponse.self, from: fetchedData)
        return dessertsResponse.meals
    }
    
    func fetchDessertDetailsData(mealId: String?) async throws -> Dessert? {
        
        guard let mealId = mealId, let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")else {
            throw URLError(.badURL)
        }
        
        let (fetchedData, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let dessertResponseArray = try JSONDecoder().decode(DessertResponse.self, from: fetchedData)
        return dessertResponseArray.meals.first
    }
}

struct DessertResponse: Decodable {
    let meals: [Dessert]
}

