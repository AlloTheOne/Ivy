//
//  popup.swift
//  Ivy
//
//  Created by Dina Alhajj Ibrahim on 15/12/2022.
//

import SwiftUI
struct PopUpWindow: View {
 var title: String
var message: String
var buttonText: String
@State private var buttonTapped = false
@Binding var showPopover: Bool
@Binding var showPopup: Bool
    
var body: some View {
ZStack {
    grids()
        .blur(radius: 2.2)
    Color.clear
    
        

// PopUp background color
//Color.black.opacity(showPopover ? 0.3 : 0)
    //.edgesIgnoringSafeArea(.all)
// PopUp Window
VStack(alignment: .center, spacing: 0) {
HStack{
  
    

    Button (action: {
        showPopup = false
        
    }, label: {
Image(systemName: "xmark")
        .resizable()
        .frame(width: 16, height: 16)
.foregroundColor(.black)

})
}
.frame(maxWidth: .infinity, alignment: .leading).padding(.bottom, 10)
    
    VStack{
    
    HStack{

        
        Text("Personal Progress:")
            .font(.headline)
            .fontWeight(.medium)
        Spacer()
        Image("redina")
            .resizable()
            .frame(width: 50, height: 50)
    }
    .padding(.horizontal)
        
  
   
        
        Text("18 Points Earned ")
            .font(.title3)
            .padding()
        
        
        Text(" For your Contribution on recycling\n Keep it up!")
            .fontWeight(.medium)
            .padding(.bottom, 10)
            .font(.subheadline)
    }
    
 
    Button(action: {
                self.buttonTapped = true
            }) {
//        withAnimation(showPopover.toggle()){
//showPopover = true
//}
//}, label: {

    }.buttonStyle(PlainButtonStyle()).cornerRadius(20)
}
 .frame(maxWidth: 250)
 .padding()
.background(.white).cornerRadius(20)
}

}
}
struct PopUpWindow_Previews: PreviewProvider {
 static var previews: some View {
     PopUpWindow(title: "Error", message: "Sorry, that email address is already used!", buttonText: "OK", showPopover: Binding<Bool>.constant(true), showPopup: Binding<Bool>.constant(true))
     
    
}
}
