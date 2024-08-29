//
//  DessertListViewModel.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation

@MainActor // makes sure any UI updates are on the main thread
class DessertListViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    @Published var isLoading = false
    @Published var errorString: String?
    
    func fetchDesserts() async {
        isLoading = true
        
        do {
            desserts = try await RestAPIServices.shared.fetchDessertData()
        } catch  {
            errorString = "Failed to fetch items: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

