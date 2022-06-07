//
//  ProfileHost.swift
//  G-Holiyay
//
//  Created by Vanness Anthony on 07/06/22.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var data: DataSet
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = data.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileDetail(profile: data.profile)
            } else {
                EditProfile(profile: $draftProfile)
                    .onAppear {
                        draftProfile = data.profile
                    }
                    .onDisappear {
                        data.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(DataSet())
    }
}
