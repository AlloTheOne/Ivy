//
//  Searchbar2.swift
//  Ivy
//
//  Created by Fatma Gazwani on 27/05/1444 AH.
//

//
//  Searchbar.swift
//  Ivy
//
//  Created by Fatma Gazwani on 21/05/1444 AH.
//

import SwiftUI

struct Searchbar2: View {
        @State private var query = ""
        var body: some View {
            VStack {
                
        TextField("Search", text: $query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())


                List {
                    // Filtered search results go here
                }
            }
            .padding(.vertical)
            .frame(width: 320, height: 60)


        }
        }

struct Searchbar2_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar2()
    }
}
