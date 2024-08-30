//
//  DessertDetailsView.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation
import SwiftUI

struct DessertDetailsView: View {
    let id: String ///variable that's being passed in
    @StateObject private var viewModel = DessertDetailsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorString {
                Text(errorMessage)
            } else {
                if let dessert = viewModel.dessert {
                    Text(dessert.strMeal)
                        .font(.title)
                    
                    Text("Hello")

                    AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.brown
                    }
                    .frame(width: 128, height: 128)
                        .clipShape(.rect(cornerRadius: 25))
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchDessert(dessertId: id)
            }
        }
    }
}
