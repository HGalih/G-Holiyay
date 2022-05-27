//
//  ContentView.swift
//  G-Holiyay
//
//  Created by student on 27/05/22.
//

import SwiftUI






struct ContentView: View {
    @State private var pilihan: Tab = .explore
    enum Tab{
        case explore
        case bookmark
        case profile
    }
    
    var body: some View {
        TabView(selection: $pilihan) {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }
                .tag(Tab.explore)
            
            BookmarkView()
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
                .tag(Tab.bookmark)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(Tab.bookmark)
        }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
