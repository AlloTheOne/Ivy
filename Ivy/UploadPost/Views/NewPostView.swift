//
//  NewPostView.swift
//  Ivy
//
//  Created by Fatma Gazwani on 13/05/1444 AH.
//

import SwiftUI

struct NewPostView: View {
    
    @State var text = "Type here"
    @State var ispickerShowing = false
    @State var selectedImage: UIImage?
    @State private var PostNewPost = false
    @State private var caption = ""
    @State private var onbordingAgain = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Color("ouroffwhite")
                .ignoresSafeArea()
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color("ourgreen"))
                }
                Spacer()
                
                Button {
                    PostNewPost.toggle()
                } label: {
                    Text("Post")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("ourgreen")/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("ouroffwhite"))
                        .clipShape(Capsule())
                }
            }
            .padding()
            .fullScreenCover(isPresented: $PostNewPost) {
                MainTabView(onbordingAgain: $onbordingAgain)
            }
            
            
            VStack(alignment: .leading){
                
                HStack(alignment: .center, spacing: 12){
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
                                
                            }
                        }
                    }
                }.padding(.horizontal)
                
                //                Circle()
                //                    .frame(width: 80, height: 80)
                
                
                
                
                //                TextEditor(text: $caption)
                //                    .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: 1)
                //                    .frame(width: 250, height: 300)
                //                    .foregroundColor(self.caption == "Hello" ? .gray : .primary)
                //                    .padding(.horizontal)
                //                    .navigationTitle("Hello")
                //                    .onTapGesture {
                //                        if self.caption == "Hello" {
                //                            self.caption = ""
                //                        }
                //                    }
                TextEditor(text: self.$text)
                    .frame(width: 350, height: 250)
                // make the color of the placeholder gray
                    .foregroundColor(self.text == "Type here" ? .gray : .primary)
                
                    .onAppear {
                        
                        // remove the placeholder text when keyboard appears
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                            withAnimation {
                                if self.text == "Type here" {
                                    self.text = ""
                                }
                            }
                        }
                        
                        // put back the placeholder text if the user dismisses the keyboard without adding any text
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                            withAnimation {
                                if self.text == "" {
                                    self.text = "Type here"
                                }
                            }
                        }
                    }
                //            TextArea("Hello?", text: $caption)
                //                    .frame(width: 350, height: 200)
                //                    .padding()
                
                
                
            }
            .padding()
            
            UploadAnImage()
            
            Spacer()
        }
    }
}
//    func addFeed(){
//    let record = CKRecord(recordType: "Feel")
//        record["text"] = self.text
//    record["imgURL"] = "Kuddah"
//    record["Major"] = "Developer"
//    record["age"] = 20
//
//        CKContainer.init(identifier: "iCloud.example.com.Cloudkitt").publicCloudDatabase.save(record){
//            record, error in
//            guard error == nil else{
//                print("EEERRRROOOOR\(error?.localizedDescription)")
//                return
//            }
//        }
//    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
