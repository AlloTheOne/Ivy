//
//  ProfileView.swift
//  tiwtterSwiftUI
//
//  Created by Sara Khalid BIN kuddah on 21/05/1444 AH.
//

import SwiftUI

struct ProfileView: View {
    @State private var GoToSting = false
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace var animation
    @State var images = ["saveEarth", "energySaving", "ecoWater"]
    @State var points  = [[50,100], [20,100], [130,200], [90,100]]
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("userId") var userId: String = ""
    
    private var isSignedIn: Bool {
        !userId.isEmpty
    }
    
    var body: some View {
       
        VStack(alignment: .leading){
            if isSignedIn {
                signInButtonView()
            }
            else {
                //                    if let name = fetchUserName() {
                //                          Text("Welcome, \(name)!")
                //                        } else {
                //                          Text("Please sign in to continue.")
                //                        }
                
                headerView
                
                userInfoDetails
                
                tweetFilterBar
                switch selectedFilter{
                case .tweets:
                    pointsView
                case .replies:
                    repliesView
                case .likes:
                    tweetsView
                }
                
                
                Spacer()
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ouroffwhite")
                .ignoresSafeArea()
            ProfileView()
        }
    }
}
//(alignment: .bottomLeading)
extension ProfileView{
    var headerView: some View{
        ZStack{
            Color("ourlightgreen")
                .ignoresSafeArea()
            
            VStack (alignment: .leading){
                Spacer(minLength: 70)
                HStack {
                  //  Spacer()
//                    Button {
//
//                    } label: {
//                        Image(systemName: "arrow.left")
//                            .resizable()
//                            .frame(width: 20, height: 16)
//                            .foregroundColor(.white)
//                           // .offset(x: -15, y: 15)
//                    }
//                    Button(action: {
//                               self.presentationMode.wrappedValue.dismiss()
//                            }) {
//                                Image(systemName: "arrow.left")
//                                   // .padding()
//                                    .resizable()
//                                                                .frame(width: 20, height: 16)
//                                                                .foregroundColor(.white)
//                                                               // .offset(x: -15, y: 15)
//                            }
//                            .navigationBarBackButtonHidden(true)
                                   
                    Spacer()
                    Button {
                        GoToSting.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                        //                        .font(.title3)
                        //                        .padding(6)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                           // .offset(x: 250, y: 20)
                    }
                    .fullScreenCover(isPresented: $GoToSting){
                        Ivy.SettingView()
                    }
                    //Spacer()
                }
                .padding(.horizontal)
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 1))
//                Circle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
                .offset(x: 30,y : 20)
            }
        }
        .frame(height: 100)
        .padding(.bottom)
    }
    
    var userInfoDetails: some View{
        VStack(alignment: .leading ,spacing: 4){
            Text("Jomana Khaed")
                .font(.title2).bold()
                .foregroundColor(Color("ourdarkgray"))
            Text("@jomanakhaled")
                .font(.subheadline)
                .foregroundColor(Color("ourlightgray"))
            Text("lets provide healthy environment for us and the new generation")
                .font(.subheadline).bold()
                .foregroundColor(Color("ourdarkgray"))
                .padding(.vertical)
        }
        .offset( y: 80)
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? Color("ourgreen") : Color("ourlightgreen"))
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color("ourgreen"))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .offset( y: 80)
        .overlay(Divider().offset(x: 0 , y: 50))
        .padding(.bottom, 73)

    }
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0...9, id: \.self){ _ in
                    PostsRawView()
                    //TweetRowView()
                        .padding()
                }
                
            }
        }
       
    }
    
    var pointsView: some View{
        VStack{
            HStack{
                //Spacer()
                Text("Total Points :")
                    .font(.title2).bold()
                    .foregroundColor(Color("ourgreen"))
                Spacer()
                Text("\(points[0][0]+points[1][0]+points[2][0]+points[3][0])")
                    .font(.title2).bold()
                    .foregroundColor(Color("ourgreen"))
                //Spacer()
            }
            .padding(.top)
                .padding(.horizontal)
            ScrollView{
                LazyVStack{
                    ForEach(points.indices, id: \.self){ index in
                        VStack {
                            HStack{
                                Text("Habit No\(index+1)")
                                    .font(.title3).bold()
                                    .foregroundColor(Color("ourdarkgray"))
                                Text("\(points[index][0])/\(points[index][1])")
                                    .font(.subheadline).italic()
                                    .foregroundColor(Color("ourgreen"))
                                Spacer()
                            }
                            ProgressView( value: Double(points[index][0]),
                                          total: Double(points[index][1]))
                            .tint((Color("ourgreen")))
                        }
                        .padding()
                        
                    }
                    
                }
            }
        }
                }
    var repliesView: some View{
        ScrollView{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 4), count: 3), content: {
                ForEach(images, id: \.self){ image in
                    Image(image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Rectangle())
                        .overlay(Rectangle()
                            .stroke(Color.white, lineWidth: 2))
                        .padding()
                }
            })
                }
                
                }
                
      
}

