//
//  MainTabView.swift
//  Ivy
//
//  Created by Fatma Gazwani on 14/05/1444 AH.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0

    var body: some View {
        
        TabView(selection: $selectedIndex){
            ContentView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "leaf")
                    Text("Habits")
                }.tag(0)
            
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "rectangle.3.group.bubble.left")
                    Text("Community")

                }.tag(1)
            
            Notification()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "bell")
                    Text("Notification")

                }.tag(2)
            
            ProfileView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")

                }.tag(3)
        }
        //من هنا نغير اللون و الخلفية
        .accentColor(Color("ourgreen"))
        .background(.thinMaterial)



    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
