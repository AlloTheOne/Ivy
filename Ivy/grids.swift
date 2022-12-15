//
//  grids.swift
//  Ivy
//
//  Created by Dina Alhajj Ibrahim on 13/12/2022.
//

import SwiftUI

struct grids: View {
 
    @State var gridLayout: [GridItem] = [ GridItem() ]
    @State private var showPopup = false
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))

    ]
    let columns: [GridItem] = [
//        GridItem(. fixed(50) , spacing: nil, alignment: .center),
//
//        GridItem(. fixed (50), spacing: nil, alignment: .center),
//
//        GridItem(.fixed(50), spacing: nil, alignment:.center),
//
//        GridItem(.fixed(50), spacing: nil, alignment: .center),
//
//        GridItem(. fixed (50), spacing: nil, alignment: .center),
        
            GridItem(spacing: 100, alignment: .center),
            GridItem(spacing: 100, alignment: .center),
            GridItem(spacing: 100, alignment: .center),
            GridItem(spacing: 100, alignment: .center),
            GridItem(spacing: 100, alignment: .center),
            GridItem(spacing: 100, alignment: .center),

                
    ]
    
    let array = ["Volunteering" , "Plastic Reduction" , "Sustainable" , "Recycling"  , "Planting" , "Safe Energy"]
    
    var body: some View {
        LazyVGrid(columns: adaptiveColumns, spacing: 30)  {
//            ForEach(samplePhotos.indices, id: \.self) { index in
//
//                Image(samplePhotos[index].name)
//                    .resizable()
//                    .scaledToFill()
//
                ForEach(0..<6) {index in
                    HStack(alignment: .center){
                        
                       
                        ZStack {
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color("ourwhite"))
                            VStack {
                                Image("pic\(index)")
                                    .resizable()
                                    .frame(width:90 ,height: 90)
                                
                                Text(array[index])
                            }
                            
                            Button(action: {
                                self.showPopup = true
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.red)

                                    .frame(width: 30, height: 30)
                                   .padding(.bottom, 160)
                                    .padding(.leading, 140)
                            }
                            
                            
                            .alert(isPresented: $showPopup) {
                                Alert(title: Text("Popup Message"), message: Text("This is a popup message"), dismissButton: .default(Text("OK")))
                                            
                        }
                            Image(systemName: "oval")
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                              // .background(Color.white)
                                .clipShape(Circle())
                                .padding(.bottom, 160)
                                .padding(.leading, 140)
                            
//                            Image(systemName: "plus")
//                                .foregroundColor(Color.red)
//
//                                .frame(width: 30, height: 30)
//                                .padding(.bottom, 160)
//                                .padding(.leading, 140)

                        }
                    }
                    .padding(.horizontal)
                   // .padding(.leading)
                }
                
            }
        
    }
        struct grids_Previews: PreviewProvider {
            static var previews: some View {
                
                grids()
            }
        }
}
//struct MyPopup: View {
//    var body: some View {
//        Text("Popup content goes here")
//            .frame(width: 200, height: 200)
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(radius: 5)
//    }
//    struct MyView: View {
//        @State private var showPopup = false
//        
//        var body: some View {
//            Button(action: {
//                self.showPopup.toggle()
//            }) {
//                Text("Show popup")
//            }
//            .popover(isPresented: $showPopup, content: {
//                MyPopup()
//            })
//        }
//        
//    }
//}
