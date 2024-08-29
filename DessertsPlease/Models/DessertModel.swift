//
//  DessertModel.swift
//  DessertsPlease
//
//  Created by Jameka Echols on 8/28/24.
//

import Foundation
import UIKit

struct Dessert: Identifiable, Decodable {
    var id: String { idMeal } // Computed property to conform to Identifiable
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}
