//
//  OnBoarding.swift
//  Ivy
//
//  Created by Alaa Alabdullah on 14/12/2022.
//

import SwiftUI

enum OnbordingType: CaseIterable {
    case scan
    case track
    case remind
    
    
    
    var image: String {
        switch self {
        case .scan:
            return "ob1"
        case .track:
            return "ob2"
        case .remind:
            return "ob3"
            
        }
    }
    
    
    var description: String {
        switch self {
        case .scan:
            return "Our app is the easy way to make your everyday habits more sustainable, at home, work, and play."
        case .track:
            return "Make changes with those around you to promote sustainability in your daily lives."
        case .remind:
            return "We take privacy seriously."
            
        }
    }
}

struct OnbordingView: View {
    
    var selectedOnbordingType: OnbordingType = .scan
    
    
    var body: some View {
        ZStack {
            VStack {
                
                
                TabView {
                    
                    ForEach(OnbordingType.allCases, id: \.description) { onbording in
                        SingleOnbording(onbordingType: onbording)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}

struct SingleOnbording: View {
    let onbordingType: OnbordingType
    @State private var showLogingPage = false
    @State private var showTabViewPage = false
    var body: some View {
        
        
            VStack(spacing:20) {
                Button("skip"){
                    showTabViewPage.toggle()
                }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing ,30)
                    .foregroundColor(.secondary)
                    .fullScreenCover(isPresented: $showTabViewPage) {
                        MainTabView()
                    }
                Spacer()
            
                Image(onbordingType.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text(onbordingType.description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    if onbordingType == .remind {
                    
                    Button("Get Started"){
                        showLogingPage.toggle()
                    }
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("ourgreen"))
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .fullScreenCover(isPresented: $showLogingPage) {
                        MainTabView()
                    }
                }
                Spacer()
            }
            .padding(.horizontal,40)
            
        }
        

        
    }

