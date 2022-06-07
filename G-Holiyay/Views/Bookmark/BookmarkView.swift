//
//  BookmarkView.swift
//  G-Holiyay
//
//  Created by student on 27/05/22.
//

import SwiftUI

struct Bookmarkview: View {
    
    @EnvironmentObject var data: DataSet
    @State private var filter = FilterCategory.all
    @State private var active: Place?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case beaches = "Beaches"
        case forest = "Forests"
        case mountains = "Mountains"
        case desert = "Deserts"
        
        var id: FilterCategory { self }
    }
    
    var filteredPlaces: [Place] {
        data.places.filter { place in
            (place.isBookmark)
            && (filter == .all || filter.rawValue == place.category.rawValue)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.black.ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("Realize your plan")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button(action: {
                                    print("Sort by Place Name")
                                }) {
                                    Label("Sort", systemImage: "arrow.up.arrow.down")
                                }
                                Menu {
                                    Picker("Category", selection: $filter) {
                                        ForEach(FilterCategory.allCases) { category in
                                            Text(category.rawValue).tag(category)
                                        }
                                    }
                                    .pickerStyle(.inline)
                                } label: {
                                    Label("Filter", systemImage: "slider.horizontal.3")
                                }
                            }
                        }
                    
                    ForEach(filteredPlaces) { place in
                        NavigationLink {
                            DetailData(place: place)
                        } label: {
                            BookmarkCardView(place: place)
                        }
                        .tag(place)
                    }
                }
            }

            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
        }
    }

}
struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        Bookmarkview()
            .environmentObject(DataSet())
    }
}

