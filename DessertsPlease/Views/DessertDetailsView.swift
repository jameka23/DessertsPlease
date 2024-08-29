//
//  DessertDetailsView.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation
import SwiftUI

struct DessertDetailsView: View {
    let id: String
    @StateObject private var viewModel = DessertDetailsViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.dessert!.strMeal) /// throwing error here
//            Image((viewModel.dessert?.mealThumbImage)!)
        }
        .onAppear() {
            Task {
                await viewModel.fetchDessert(dessertId: viewModel.dessert!.idMeal)
            }
        }
    }
}
