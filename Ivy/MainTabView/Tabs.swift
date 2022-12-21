//
//  Tabs.swift
//  Ivy
//
//  Created by Fatma Gazwani on 25/05/1444 AH.
//

import SwiftUI

struct Tabs: View {
	var gridItems = [GridItem]()
	
	
	var body: some View {
		
		TabView {
			
			ContentView()
				.tabItem {
					Label("Habits", systemImage: "leaf")
				}
			
			FeedView()
				.tabItem {
					Label("Community", systemImage: "rectangle.3.group.bubble.left")
				}
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person")
				}
		}
		.accentColor(Color("ourgreen"))
		.background(.thinMaterial)
		.onAppear {
			let tabBarAppearance = UITabBarAppearance()
			tabBarAppearance.configureWithDefaultBackground()
			UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
			//  .cornerRadius(30)
			//	 .ignoresSafeArea()
			//
			
			
		}
	}
}
	struct Tabs_Previews: PreviewProvider {
		static var previews: some View {
			Tabs()
		}
	}

