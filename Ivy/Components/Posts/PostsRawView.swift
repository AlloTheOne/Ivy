//
//  PostsRawView.swift
//  Ivy
//
//  Created by Fatma Gazwani on 13/05/1444 AH.
//

import SwiftUI

struct PostsRawView: View {
    var body: some View {
        VStack (alignment: .leading){
            //Profile + user info + post
            HStack(alignment: .top, spacing: 12){
                    Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("ourdarkgray"))
                //User info + Post
                VStack (alignment: .leading, spacing: 4){
                    //user infor
                    VStack (alignment: .leading){
                        Text("Dreamers")
                            .font(.subheadline).bold()
                            .foregroundColor(Color("ourdarkgray"))

                        HStack {
                            Text("@dreamers")
                                .font(.caption)
                                .foregroundColor(Color("ourlightgray"))

                            
                            Text("2 w")
                                .font(.caption)
                                .foregroundColor(Color("ourlightgray"))
                        }
                    }
                    .padding()

                    VStack{
                        //post
                        Text("For our environment's revival")
                            
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("ourdarkgray"))
                    }

                }
            }
            //Action buttons
            HStack{
                Spacer()

                Button{
                    //action goes here
                }label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button{
                    //action goes here
                }label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.subheadline)
                }
                Spacer()

                
                Button{
                    //action goes here
                }label: {
                    LikeButtonView()

//                    Image(systemName: "heart")
//                        .font(.subheadline)
                }
                
                Spacer()

              
            }
            .padding()
            .foregroundColor(Color("ourlightgray"))
            Divider()

        }
        .padding()
        
        
    }
}

struct PostsRawView_Previews: PreviewProvider {
    static var previews: some View {
        PostsRawView()
    }
}
