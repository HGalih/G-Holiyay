//
//  Bookmark.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

struct Bookmark {
    static var places: [Place] = []
    static func setup() {
        if places.isEmpty {
            places = load("dataSet.json")
        }
    }
}
