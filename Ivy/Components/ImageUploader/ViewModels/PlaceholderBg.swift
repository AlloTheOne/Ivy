//
//  PlaceholderBg.swift
//  Ivy
//
//  Created by Fatma Gazwani on 27/05/1444 AH.
//

import SwiftUI

struct PlaceholderBg: View {

let text: String?

init(text:String? = nil) {
        UITextView.appearance().backgroundColor = .clear // necessary to remove the default bg
    
    self.text = text
 }

var body: some View {
    VStack {
    HStack{
    
    Text(text!)
          
    Spacer()
    }
    Spacer()
    }
}
    
}


