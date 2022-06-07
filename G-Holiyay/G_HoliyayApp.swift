//
//  G_HoliyayApp.swift
//  G-Holiyay
//
//  Created by student on 27/05/22.
//

import SwiftUI

@main
struct G_HoliyayApp: App {
    @StateObject private var data = DataSet()
    var body: some Scene {
        WindowGroup {
            splashscreen()
                .environmentObject(data)
        }
    }
}
