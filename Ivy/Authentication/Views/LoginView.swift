//
//  LoginView.swift
//  Ivy
//
//  Created by Alaa Alabdullah on 07/12/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack{
                AuthenticationHeader(title1: "Welcome To Ivy!", title2: "Please Login So You Can Access This Feature")
                //.padding(.top , 600)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("ourgreen"))
                VStack(spacing: 40) {
                    //TextField("Email", text: $email)
                    CustomInputField(placeholderText: "Email", text: $email)
                    //TextField("Password", text: $password)
                    CustomInputField(placeholderText: "Password", text: $password)
                }
                .padding(.horizontal , 32)
                .padding(.top, 24)
                //.border(solid, 4)
                
                
                
                Button{
                    print("sign in here")
                } label: {
                    Text("Sign in")
                        .font(.headline)
                    //.fontWeight(.semibold)
                        .foregroundColor(Color("ourgreen"))
                        .frame(width: 340, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("ourgreen"), lineWidth: 0))
                }.background(Color("ourlightgreen")) // If you have this
                    .cornerRadius(10)
                    .padding()
                    .padding(.top)
                
                Spacer()
                // NavigationStack{
//                NavigationLink(destination: RegisterationView()){
//                    //RegisterationView()
//                    Text("Register")
//                }
                //}
                //Text("Sign up") //Forgot Password
                NavigationLink {
                    RegisterationView()
                    .navigationBarHidden(true)
                } label: {
                    Text("Not A Member? Sign Up")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ourlightgreen"))
                        .frame(width: 340, height: 50)
                }
             }.background(Color("ouroffwhite"))
                .navigationBarHidden(true)
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
