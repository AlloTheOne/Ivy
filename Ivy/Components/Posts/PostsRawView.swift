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
                    .frame(width: 70, height: 70)
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
                    .padding(.vertical)

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
                
                Button(action: {
                    share()
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .renderingMode(.original)
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
            .padding(.bottom, 5)
            .foregroundColor(Color("ourgreen"))
            Divider()

        }
        .padding()
        
        
    }
}

func share() {
    guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
    let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    
}
 

struct PostsRawView_Previews: PreviewProvider {
    static var previews: some View {
        PostsRawView()
    }
}


