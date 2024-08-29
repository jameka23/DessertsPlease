//
//  ContentView.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            DessertListView()
                .navigationTitle("Desserts")
        }
    }
}

#Preview {
    ContentView()
}
