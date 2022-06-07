//
//  ProfileView.swift
//  G-Holiyay
//
//  Created by student on 27/05/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var data: DataSet
    @State private var showingProfile = false
    
    var body: some View {
        
        NavigationView {
            ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Text("")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button {
                                showingProfile.toggle()
                            } label: {
                                Label("Edit Profile", systemImage: "pencil")
                            }
                            }
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                            .environmentObject(data)
                    }
                
                ProfileDetail(profile: data.profile)
            }}
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(DataSet())
    }
}
