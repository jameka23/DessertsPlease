//
//  DessertDetailsViewModel.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation

@MainActor
class DessertDetailsViewModel: ObservableObject {
    @Published var dessert: Dessert?
    @Published var isLoading: Bool = false
    @Published var errorString: String?
    
    
    func fetchDessert(dessertId: String) async {
        isLoading = true
        
        do {
            dessert = try await RestAPIServices.shared.fetchDessertDetailsData(mealId: dessertId)
        } catch  {
            errorString = "Error occured fetching data."
        }
        isLoading = false
    }
}
