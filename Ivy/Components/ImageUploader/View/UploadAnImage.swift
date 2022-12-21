//
//  uploadanimage.swift
//  Ivy
//
//  Created by Fatma Gazwani on 14/05/1444 AH.
//
import SwiftUI

struct UploadAnImage: View {
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?

//    @State private var image = UIImage()
//    @State private var showSheet = false
    
    var body: some View {
//    HStack {
//            Image(uiImage: self.image)
//                .resizable()
//                .frame(width: 300, height: 200)
//                .background(Color.black.opacity(0.2))
//                .aspectRatio(contentMode: .fill)
//                .onTapGesture {
//                    showSheet = true
//                }
//        }
//        .padding(.horizontal, 20)
//        .sheet(isPresented: $showSheet) {
//            // Pick an image from the photo library:
//            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

            VStack {
                if selectedImage != nil {
                    
                    Image (uiImage: selectedImage!)
                    
                        .resizable ()
                        .frame (width: 200, height: 200)
                }
                    Button {
                        // Show the image picker
                        isPickerShowing = true
                    } label: {
                        Text ("Add a Photo" )
                            .foregroundColor(Color("ourgreen"))
                    }
                }
            .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            // Image picker
            
                ImagePicker (selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
            //  If you wish to take a photo from camera instead:
            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
    }
}
struct UploadAnImage_Previews: PreviewProvider {
    static var previews: some View {
        UploadAnImage()
    }
}
