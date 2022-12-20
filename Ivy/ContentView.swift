//
//  ContentView.swift
//  Ivy
//
//  Created by Alaa Alabdullah on 07/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color("ouroffwhite")
                .ignoresSafeArea()
            
            ZStack{
                VStack {
                    search_bar_tool()
                        .frame( height: 150)
                    
                    // VStack {
                    
                    Rectangle()
                        .fill(Color("ourgreen"))
                        .frame(width: 350, height: 1)
                    Text("What eco-friendly habits have you accomplished today?")
                        .foregroundColor(Color("ourgreen"))
                    
                        .multilineTextAlignment(.center)
                       // .padding(.bottom, 10)
                    Rectangle()
                        .fill(Color("ourgreen"))
                        .frame(width: 350, height: 1)
                        .padding(.bottom, 40)
                    
                    
                    
                    grids()
                    Spacer()
                    
                    
                    
                    
                    
                    
                }
                // .padding(.top)
            }
        }   .ignoresSafeArea()

        }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MainTabView()
            
        }
    }
    
}
