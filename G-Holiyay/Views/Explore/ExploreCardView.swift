import SwiftUI

struct ExploreCardView: View {
    @EnvironmentObject var data: DataSet
    var place: Place
    
    var body: some View {
        HStack(alignment: .center) {
            place.thumbnail
                .resizable()
                .frame(width: 160, height: 160)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(place.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Label(place.city + ", " + place.country, systemImage: "pin.fill")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .lineLimit(1)
                
                Label("Date", systemImage: "calendar")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color("mainBlue"))
                    .foregroundColor(.white)
                    .font(.body.bold())
                    .cornerRadius(10)
                    .padding(.bottom, 4)
            }
            .foregroundColor(Color("abu"))
            .padding()
        }
        .padding(.trailing, 18)
        .overlay(Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("mainBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 9, height: 160, alignment: .top), alignment: .trailing)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(Color("hitam"))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct ExploreCardView_Previews: PreviewProvider {
    static let data = DataSet()
    
    static var previews: some View {
        ExploreCardView(place: places[0])
            .environmentObject(data)
    }
}
