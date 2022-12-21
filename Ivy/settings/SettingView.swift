//
//  SettingView.swift
//  Ivy
//
//  Created by nouf on 14/05/1444 AH.
//

import SwiftUI

struct SettingView: View {
    @State private var ContentView = false
    @State private var Language = true
//    @State private var Mode = false
    @AppStorage("isDarkMode") private var isDarkMode = false

    @State var showpopscrean: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color("ouroffwhite")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    
                    
                    Text("Setting")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 55.0)
                        .padding(.trailing, 209.0)
                        .opacity(1)
                    
                    VStack(alignment: .leading, spacing: 24){
                        
                        //اللغة
//                        HStack{
//                            Image(systemName: "globe")
//                                .font(.system(size: 20))
//                                .foregroundColor(Color("ourgreen"))
//
//                            Toggle(isOn: $Language) {
//                                Text("Language")
//                                    .font(.system(size: 22))
//                                    .foregroundColor(Color("ourgreen"))
//                            }
//
//
//                            //الدارك و اللايت
//                        }
//                        HStack{
//                            Image(systemName: "moon.circle")
//                                .font(.system(size: 22))
//                                .foregroundColor(Color("ourgreen"))
//                            Toggle(isOn: $isDarkMode) {
//                                Text("Mode")
//                                    .font(.system(size: 22))
//                                    .foregroundColor(Color("ourgreen"))
//                            }
//                        }
                        
                        
                        //عنا
                        HStack{
                            Image(systemName: "leaf.circle")
                                .font(.system(size: 22))
                                .foregroundColor(Color("ourgreen"))
                            NavigationLink(destination: Ivy.About()) {
                                Text("About us")
                            }
                            .font(.system(size: 22))
                            .foregroundColor(Color("ourgreen"))
                            
                        }
                        
                        //شير
                        HStack{
                            
                            Image(systemName: "square.and.arrow.up.circle")
                                .font(.system(size: 22))
                                .foregroundColor(Color("ourgreen"))
                            //                    Text("Share App")
                            Button(action: {
                                share()
                            }) {
                                Text("Share App")
                                    .font(.system(size: 22))
                                    .foregroundColor(Color("ourgreen"))
                                
                            }
                            
                            
                        }
                        
                        //السريه
                        HStack{
                            Image(systemName: "lock.circle")
                                .font(.system(size: 22))
                                .foregroundColor(Color("ourgreen"))
                            
                            NavigationLink(destination: PolicyUIView() ) {
                                Text("Privacy Policy")
                            }
                            .font(.system(size: 22))
                            .foregroundColor(Color("ourgreen"))
                            
                            
                        }
                        
                        //تسجيل خروج
                        HStack{
                            Menu {
                                
                                Button("Cancel", role: .destructive) {
                                    // Do something
                                }
                                
                                
                                Button {
                                    ContentView.toggle()
                                    // Do something
                                } label: {
                                    
                                    Label("Log out", systemImage: "arrow.right.circle")
                                    
                                }.padding()
                                
                                
                                Text("Are you sure to sign out of the account?")
                            } label: {
                                Label("Log out", systemImage: "arrow.right.circle")
                                
                                    .font(.system(size: 22))
                                    .foregroundColor(Color("ourgreen"))
                            }
                            
                        }
                        //حذف حساب
                        HStack{
                            Menu {
                                
                                Button("Cancel", role: .destructive) {
                                    
                                }
                                Button {
                                    ContentView.toggle()
                                } label: {
                                    
                                    Label("Delete Account", systemImage: "arrow.right.circle")
                                }
                                Text("Are you sure to Delete your Account ?")
                            } label: {
                                Label("Delete Account", systemImage: "xmark.bin.circle")
                                    .font(.system(size: 22))
                                    .foregroundColor(Color("ourred"))
                            }
                        }
                        
                    }
                    
                    
                 Spacer()
                    
                }
                   
                
                    .fullScreenCover(isPresented: $ContentView) {
                        Ivy.ContentView()
                        
                        // .fullScreenCover(isPresented: $About) {
                        //   Ivy.About()
                        
                    }
                
                
            }
        }
    }
        
        
        
        
        
        
        
        func share() {
            guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
        
        
    }
    
    
    struct SettingView_Previews: PreviewProvider {
        static var previews: some View {
            SettingView()
            
        }
    }
