//
//  PolicyUIView.swift
//  Ivy
//
//  Created by nouf on 19/05/1444 AH.
//

import SwiftUI

struct PolicyUIView: View {
    var body: some View {
        ZStack{
            Color("ouroffwhite")
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 15) {
                
                
                
                Text("Privacy Policy")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ourlightgray"))
                    .padding()
                
                Text("Ivy is a mobile app made by Dreamers team in Apple’s Developer Academy.that lets you share art with the world and sell it, right on your Home Screen. In Artópia, we care deeply about keeping your data private and secure. \n \nBelow, we outline what data we collect, how we use and share it, and your rights.\n \nData Collection And Use \n \nAccount Data \n When you sign up for an account on Ivy, we may collect your phone number and email address and location and payment details. This Account Data may also be used to respond to your messages.  \n \nPhotos\nWe collect the photos you add on Ivy together with the associated metadata such as the time the photo was taken. We do not collect any location metadata from your photos. We work hard to keep this data private and secure. \n \n Device and App Activity Data \n When you use Ivy, we automatically collect certain information about your device (such as the type of device, operating system, IP address, and unique identifiers) and how you interact with the app (such as the actions you take and how long you use the app). We use this information to improve the app, create new features,and keep our systems secure.")
                    .font(.caption)
                    .foregroundColor(Color("ourdarkgray"))
                    .padding()
            Spacer()
            }
            
        }
    }
}
struct PolicyUIView_Previews: PreviewProvider {
    static var previews: some View {
        PolicyUIView()
    }
}
