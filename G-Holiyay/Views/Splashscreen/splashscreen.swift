//
//  splashscreen.swift
//  G-Holiyay
//
//  Created by student on 02/06/22.
//

import SwiftUI

struct splashscreen: View {
    @State private var isActive = false
    func switchScreen(time: Double) {
           DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
               self.isActive = true
           }
       }
    var body: some View {
        if(isActive == true){
            ContentView()
        }
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width:225,height:242)
                Text("G-Holiyay")
                    .font( .largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color("mainBlue"))
            }
        }
        .onAppear{
            self.switchScreen(time: 2)
        }
    }}
struct splashscreen_Previews: PreviewProvider {
    static var previews: some View {
        splashscreen()
    }
}
