//
//  TextArea.swift
//  Ivy
//
//  Created by Fatma Gazwani on 13/05/1444 AH.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        ZStack(alignment: .topLeading){

            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }

            TextEditor(text: $text)
                .padding(4)
                .frame(width: 350, height: 200)
                .border(Color(hue: 1.0, saturation: 0.0, brightness: 0.769), width: 1)

        }
        .font(.body)

    }
}

