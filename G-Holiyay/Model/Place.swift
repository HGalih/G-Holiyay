//
//  place.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Place: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var country: String
    var description: String
    var city: String
    var isBookmark: Bool
    var BookDate: String?
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case beaches = "Beaches"
        case deserts = "Deserts"
        case forests = "Forests"
        case mountains = "Mountains"
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    private var imageExploreBookmark: String
    var thumbnail: Image {
        Image(imageExploreBookmark)
    }
}
