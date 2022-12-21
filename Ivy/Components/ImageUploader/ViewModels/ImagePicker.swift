////
////  ImageUploader.swift
////  Ivy
////
////  Created by Fatma Gazwani on 14/05/1444 AH.
////
//
//
////
////  ImagePicker.swift
////  testimagepicker
////
////  Created by Fatma Gazwani on 14/05/1444 AH.
////
//
//import SwiftUI
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Environment(\.presentationMode) private var presentationMode
//    var sourceType: UIImagePickerController.SourceType = .photoLibrary
//    @Binding var selectedImage: UIImage
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//
//        let imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = sourceType
//        imagePicker.delegate = context.coordinator
//
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//        var parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                parent.selectedImage = image
//            }
//
//            parent.presentationMode.wrappedValue.dismiss()
//        }
//
//    }
//}

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    func makeCoordinator ( ) -> Coordinator {
        return Coordinator (self)
    }
}
class Coordinator: NSObject, UIImagePickerControllerDelegate,
                   UINavigationControllerDelegate {
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
    self.parent = picker
}
func imagePickerController (_ picker: UIImagePickerController,
                            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey :Any]) {
                // Run code when the user has selected an image
                            print ("image selected")
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        
            DispatchQueue.main.async {
                self.parent.selectedImage = image
                
                }
            }
    //Dismiss Picker
        parent.isPickerShowing = false
        }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Run code when the user has cancelled the picker UI
        print ("cancelled")
        //Dismiss Picker
            parent.isPickerShowing = false
    }
}
