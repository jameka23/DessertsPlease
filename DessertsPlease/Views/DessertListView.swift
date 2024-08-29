//
//  DessertListView.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation
import SwiftUI

struct DessertListView: View {
    @StateObject private var viewModel = DessertListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let errorMessage = viewModel.errorString {
                Text(errorMessage)
            } else {
                List(viewModel.desserts) { item in
                    NavigationLink(destination: DessertDetailsView(id: item.idMeal)) {
                        Text(item.strMeal)
                    }
                }
            }
        }
        .onAppear() {
            Task {
               await viewModel.fetchDesserts()
            }
        }
    }
}
