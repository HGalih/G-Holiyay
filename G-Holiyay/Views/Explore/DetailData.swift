//
//  DetailData.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import SwiftUI

struct DetailData: View {
    @EnvironmentObject var data: DataSet
    @State private var isPresented = false
    var place: Place
        
    var body: some View {
       
        ScrollView {
            MapView(coordinate: place.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 265)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(place.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 20) {
                    Text(place.category.rawValue)
                        .padding(15)
                
                        .background(Capsule().stroke(lineWidth: 2))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Label(place.city + ", " + place.country, systemImage: "pin.fill")
                    
                        .font(.system(size: 18, weight: .medium, design: .default))
                }
                .font(.subheadline)
                .foregroundColor(Color("mainBlue"))
                
                Divider()
                    .padding(.vertical, 6)
                
                Text(place.description)
                    .padding(.bottom)
                    .foregroundColor(.white)
                
                Button {
                    isPresented.toggle()
                } label: {
                    Label("Plan The Visit Date", systemImage: "calendar")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
                .buttonStyle(PrimaryButton())
                .fullScreenCover(isPresented: $isPresented) {
                    CalendarView(places: self.place)
                }
            }
            
            .padding()
        }
        .background(.black)
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
    
struct CalendarView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var placesData: DataSet
    var places: Place
    
    var placeIndex: Int {
        placesData.places.firstIndex(where: { $0.id == places.id })!
    }
    @State var visitDate = Date()
    
    func dateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        return dateFormatter.string(from: visitDate)
    }
    
    var body: some View {
        ZStack{
        HStack {
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
       
//            Color.black.ignoresSafeArea()
        
        VStack {
            
            Text("Set Plan")
                .font(.title2)
                .fontWeight(.heavy)
                .padding()
                .foregroundColor(.white)
            
            Image("visit_date")
                .resizable()
                .scaledToFit()
                .padding(.bottom)
            
            DatePicker(selection: $visitDate, in: ...Date(), displayedComponents: .date) {
            }
            .onChange(of: visitDate) { _ in
                Bookmark.setup()
                Bookmark.places[placeIndex].isBookmark = true
                print(dateFormat())
            }
            .datePickerStyle(GraphicalDatePickerStyle())
            .accentColor(Color("mainBlue"))
            .clipped()
            
            .labelsHidden()
            .padding(.horizontal)
            .foregroundColor(.white)
            .padding()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label("Save to Bookmark", systemImage: "bookmark.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButton())
            .padding(.top, 25)
            .padding(.horizontal)
        }}
    }
}

struct DetailData_Previews: PreviewProvider {
    static let placesData = DataSet()
    
    static var previews: some View {
        DetailData(place: DataSet().places[0])
            .environmentObject(placesData)
    }
}
