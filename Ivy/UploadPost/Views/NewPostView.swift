//
//  NewPostView.swift
//  Ivy
//
//  Created by Fatma Gazwani on 13/05/1444 AH.
//

import SwiftUI

struct NewPostView: View {
    @State var ispickerShowing = false
    @State var selectedImage: UIImage?
    @State private var PostNewPost = false
    @State private var caption = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
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
                MainTabView()
            }

            
            HStack(alignment: .top){
                Circle()
                    .frame(width: 70, height: 70)
                
            TextArea("Hello?", text: $caption)
                
            }
            .padding()
            
//            VStack{
//                VStack {
//                    if selectedImage != nil {
//                        Image(uiImage: selectedImage! )
//                            .resizable()
//                            .frame(width: 350 ,height: 350)
//                            .cornerRadius(40)
//                            .padding(.trailing, 2.0)
//
//
//                    }
//                    else {
//
//
//                        Image("Pic1")
//                            .resizable()
//                            .frame(width: 350 ,height: 350)
//                            .cornerRadius(40)
//                            .padding()
//                    }
//                }
//
//
//                VStack{
//                    Button {
//                        ispickerShowing = true
//
//
//                    } label: {
//
//                        HStack {
//
//                            Image(systemName: "ourgreen")
//
//                                .font(.system(size:20))
//                                .foregroundColor(.white)
//                                .padding([.vertical,.leading])
//                            Text("picture")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .frame(width: 100, height: 40)
//
//
//                        }.frame(width: 170,height: 40).background(Color("ourwhite"))
//
//                            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
//
//
//                            .sheet(isPresented:$ispickerShowing, onDismiss: nil){
//                                //            image picker
//                                ImagePicker(selectedImage: $selectedImage , isPickerShowing: $ispickerShowing)
//
//
//                            }
//
//                    }
//
//
//
//                    }
//            }
            
            UploadAnImage()
            
            Spacer()
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
    
}
