//
//  CardView.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var data: DataSet
    @State private var topPadding: Bool = true
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.black.ignoresSafeArea()
            ScrollView {
                
                VStack {
                    slide()
                        .frame(width: UIScreen.main.bounds.width - 45, height: 320)
                    ZStack{
                    VStack {
                        Text("Start your memorable holiday")
                            .font(.system(size: 25))
                            .fontWeight(.black)
                        
                        ScrollView {
                            DisclosureGroup("Beaches", isExpanded: $topPadding) {
                                
                                ForEach(places) { place in
                                    
                                    if place.category.rawValue == "Beaches" {
                                        NavigationLink {
                                            DetailData(place: place)
                                        } label: {
                                            ExploreCardView(place: place)
                                        }
                                        .tag(place)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Mountains") {
                                
                                ForEach(places) { place in
                                    
                                    if place.category.rawValue == "Mountains" {
                                        NavigationLink {
                                            DetailData(place: place)
                                        } label: {
                                            ExploreCardView(place: place)
                                        }
                                        .tag(place)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Forests") {
                                
                                ForEach(places) { place in
                                    
                                    if place.category.rawValue == "Forests" {
                                        NavigationLink {
                                            DetailData(place: place)
                                        } label: {
                                            ExploreCardView(place: place)
                                        }
                                        .tag(place)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Deserts") {
                                
                                ForEach(places) { place in
                                    
                                    if place.category.rawValue == "Deserts" {
                                        NavigationLink {
                                            DetailData(place: place)
                                        } label: {
                                            ExploreCardView(place: place)
                                        }
                                        .tag(place)
                                    }
                                }
                            }
                            
                        }
                    }
                        
                    }
                }
                .padding()
                .navigationBarHidden(true)
                
            }
        }
        }
    }
}

struct slide: View {
    
    var body: some View {

        TabView {
            Image("beach_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Beach"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.blue)
            
            Image("forest_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Forest"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.green)
            
            Image("mountain_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Mountain"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.blue)
            
            Image("desert_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Desert"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.yellow)
        }
        .font(.title2.bold())
        .tabViewStyle(PageTabViewStyle())
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
