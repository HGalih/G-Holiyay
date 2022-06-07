//
//  ProfileDetail.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import SwiftUI

struct ProfileDetail: View {
    
    @EnvironmentObject var data: DataSet
    var profile: Profile
    
    var body: some View {
        
        VStack {
            (Text("Hello, ") +
             Text("\(profile.firstName) \(profile.lastName)"))
                .font(.system(size: 25))
                .fontWeight(.black)
                .padding()
                .foregroundColor(.white)
            
            VStack() {
                Image(systemName: "person.text.rectangle.fill")                        .font(.system(size: 100))
                    .foregroundColor(Color("mainBlue"))
                    .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("\(Image(systemName: "quote.opening"))  First Name")
                        .bold()
                    Text(profile.firstName)
                        .foregroundColor(Color("abu"))
                    
                    Text("\(Image(systemName: "quote.closing"))  Last Name")
                        .bold()
                    Text(profile.lastName)
                        .foregroundColor(Color("abu"))
                    
                    (Text("\(Image(systemName: "flag.fill"))  Country of Domicile") +
                     Text("                        "))
                        .bold()
                    Text(profile.country)
                        .foregroundColor(Color("abu"))
                    
                    Text("\(Image(systemName: "figure.stand"))  Gender")
                        .bold()
                    Text(profile.gender.rawValue)
                        .foregroundColor(Color("abu"))
                    
                    Text("\(Image(systemName: "number"))  Age")
                        .bold()
                    Text(profile.age.description)
                        .foregroundColor(Color("abu"))
                }
                .font(.title3)
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .padding()
            .background(Color("hitam"))
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        .padding(.top)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarHidden(true)
    }
}

struct ProfileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetail(profile: Profile.default)
            .environmentObject(DataSet())
    }
}
