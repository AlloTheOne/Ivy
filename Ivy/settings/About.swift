//
//  About.swift
//  Ivy
//
//  Created by nouf on 19/05/1444 AH.
//

import SwiftUI

struct About: View {
    var body: some View {
        ZStack{
            Color("ouroffwhite")
                .ignoresSafeArea()
            VStack(alignment: .leading , spacing: 15) {
                
                
                
                Text("About us")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ourlightgray"))
                    .padding()
                
                Text("Ivy is a mobile app made by Dreamers team in Apple’s Developer Academy.")
                    .font(.caption)
                    .foregroundColor(Color("ourdarkgray"))
                    .padding()
                
            }.padding(.bottom, 90.0)
            
        }
        
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
