//
//  FeedView.swift
//  Ivy
//
//  Created by Fatma Gazwani on 13/05/1444 AH.
//

import SwiftUI

struct FeedView: View {
    
    var Filter = ["Trending", "Latest"]
    @State private var selectedtab = "Trending"
    @State private var ShowNewPostView = false
    @State private var selectedFilter: PostFilterViewModel = .trending
    @Namespace var animation
    var body: some View {
        
        
        ZStack {
            Color("ouroffwhite")
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Spacer()
                    //                search_bar_tool()
                    //                    .frame( height: 100)
                    Searchbar2()
                    //                    .padding()
//                                       .frame( width: 300)
                    Button{
                        ShowNewPostView.toggle()
                    }label:{
                        Image("plus.app.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 40)
                            .foregroundColor(Color("ourdarkgray"))
                    }
                    //.padding()
                    .fullScreenCover(isPresented: $ShowNewPostView) {
                        NewPostView()
                    }
                }.padding(.horizontal)
                
                VStack{
                                Picker("Please choose a filter", selection: $selectedtab) {
                                    ForEach(Filter, id: \.self) {
                                        Text($0)
                                    }
                                }
                        .pickerStyle(.segmented)
                        .foregroundColor(Color("ourgreen"))


                    
//                HStack{
//                    ForEach(PostFilterViewModel.allCases, id: \.rawValue){ item in
//                        VStack{
//                            Text(item.title)
//                                .foregroundColor(Color("ourgreen"))
//                                .font(.headline)
//                                .fontWeight(selectedFilter == item ? .semibold: .regular)
//                            //   .foregroundColor(selectedFilter == item .black,: .gray)
//                            if selectedFilter == item {
//                                Capsule()
//                                    .foregroundColor(Color("ourgreen"))
//                                    .frame(height: 3)
//                                    .matchedGeometryEffect(id: "filter", in: animation)
//
//                            } else {
//                                Capsule()
//                                    .foregroundColor(Color(.clear))
//                                    .frame(height: 3)
//                            }
//                        }
//                        .onTapGesture {
//                            withAnimation(.easeInOut){
//                                self.selectedFilter = item
//                            }
//                        }
//                    }
//
//                }
                
//                .overlay(Divider() .offset (x: 0 ,y: 20))
                
                ZStack (alignment: .bottomTrailing){
                    ScrollView{
                        LazyVStack {
                            ForEach(0 ... 20, id: \.self){_ in
                                PostsRawView()
                                
                            }
                            
                        }
                    }
                }.padding(.horizontal)
            }          //          .padding()

            }
        }
    
        
    }
}
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("ouroffwhite")/*@END_MENU_TOKEN@*/)
        }
    }

