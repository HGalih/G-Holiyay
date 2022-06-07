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
                
                Bookmarkview()
                    .tabItem {
                        Label("Bookmark", systemImage: "bookmark")
                    }
                    .tag(Tab.bookmark)
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(Tab.profile)
            }
            
            .preferredColorScheme(.dark)
        

        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().preferredColorScheme(.dark)
                .environmentObject(DataSet())
        }
    }

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding()
            .background(Color("mainBlue"))
            .foregroundColor(.white)
            .font(.body.bold())
            .cornerRadius(8)
    }
}
