//
//  BookmarkCardView.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import SwiftUI

struct BookmarkCardView: View {
    @EnvironmentObject var data: DataSet
    var place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            place.thumbnail
                .resizable()
                .scaledToFill()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    HStack(spacing:20) {
                        Button(action: {}) {
                            Text(place.category.rawValue)
                                .padding()
                        }
                        .background(Capsule().stroke(lineWidth: 2))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        
                        Label(place.city + ", " + place.country, systemImage: "pin.fill")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .lineLimit(1)
                    }
                    .font(.subheadline)
                    .foregroundColor(Color("abu"))
                    .padding(.bottom)
                }
            }
            .padding(20)
        }
        .background(Color("hitam"))
        .cornerRadius(16)
        .padding(.bottom)
    }
}

struct BookmarkCardView_Previews: PreviewProvider {
    static let data = DataSet()
    
    static var previews: some View {
        BookmarkCardView(place: DataSet().places[0])
            .environmentObject(data)
    }
}
