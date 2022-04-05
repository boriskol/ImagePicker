//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by Borna Libertines on 05/04/22.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
   
   var sourceType = UIImagePickerController.SourceType.camera
   @Binding var chosenImage: UIImage
   @Environment(\.presentationMode) var presentationMode
   
   func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
      let myImagePicker = UIImagePickerController()
      myImagePicker.sourceType = sourceType
      myImagePicker.allowsEditing = true
      myImagePicker.delegate = context.coordinator
      return myImagePicker
      
   }
   func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
   
   func makeCoordinator() -> Coordinator {
      Coordinator(self)
   }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
   var imagePicked: ImagePicker
   
   init(_ imagePicked: ImagePicker) {
      self.imagePicked = imagePicked
   }
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
         imagePicked.chosenImage = image
      }
      
      imagePicked.presentationMode.wrappedValue.dismiss()
      
   }
   
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      imagePicked.presentationMode.wrappedValue.dismiss()
   }
   
}
