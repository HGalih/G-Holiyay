//
//  profile.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import Foundation

struct Profile {
    
    var firstName: String
    var lastName: String
    var country: String
    var gender = Gender.male
    var age: Int
    
    static let `default` = Profile(firstName: "Galih", lastName: "Kumbara", country: "Indonesia", age: 21)
    
    enum Gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"
        
        var id: String { rawValue }
    }
    
}
