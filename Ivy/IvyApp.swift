//
//  IvyApp.swift
//  Ivy
//
//  Created by Alaa Alabdullah on 07/12/2022.
//

import SwiftUI

@main
struct IvyApp: App {
    @State private var onbordingAgain = true
    var body: some Scene {
        
        WindowGroup {
//      Tabs()
//            ContentView()
     //      OnbordingView()
            MainTabView(onbordingAgain: $onbordingAgain)
        }
    }
}
